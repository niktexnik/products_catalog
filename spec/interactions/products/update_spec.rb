require 'rails_helper'

RSpec.describe Products::Update do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let!(:product) { FactoryBot.create(:product) }
    let(:params) { { id: product.id, name: 'Updated product',
                     description: 'Updated description', full_description: 'Updated full description',
                     image: Rails.root.join('spec/fixtures/files/images/sample2.png').open } }

    it 'returns valid' do
      expect(run).to be_valid
      expect(run.result).to have_attributes(name: 'Updated product', description: 'Updated description', full_description: 'Updated full description')
      expect(run.result.image.identifier).to eq('sample2.png')
    end

    context 'when user not pass name' do
      before do
        params.delete(:name)
      end
      
      it 'returns valid' do
        expect { run }.not_to change(product, :name)
        expect(run).to be_valid
        expect(run.result).to have_attributes(name: product.name, description: 'Updated description', full_description: 'Updated full description')
        expect(run.result.image.identifier).to eq('sample2.png')
      end
    end

    context 'when user pass blank name' do
      before do
        params[:name] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

    context 'when user not pass description' do
      before do
        params.delete(:description)
      end
      
      it 'returns valid' do
        expect { run }.not_to change(product, :description)
        expect(run).to be_valid
        expect(run.result).to have_attributes(name: 'Updated product', description: product.description, full_description: 'Updated full description')
        expect(run.result.image.identifier).to eq('sample2.png')
      end
    end

    context 'when user pass blank description' do
      before do
        params[:description] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end
  
    context 'when user not pass full_description' do
      before do
        params.delete(:full_description)
      end
      
      it 'returns valid' do
        expect { run }.not_to change(product, :full_description)
        expect(run).to be_valid
        expect(run.result).to have_attributes(name: 'Updated product', description: 'Updated description', full_description: product.full_description)
        expect(run.result.image.identifier).to eq('sample2.png')
      end
    end

    context 'when user pass blank full_description' do
      before do
        params[:full_description] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

    context 'when user not pass image' do
      before do
        params.delete(:image)
      end
      
      it 'returns valid' do
        expect { run }.not_to change(product, :image)
        expect(run).to be_valid
        expect(run.result).to have_attributes(name: 'Updated product', description: 'Updated description', full_description: 'Updated full description')
        expect(run.result.image.identifier).to eq('sample.png')
      end
    end

    context 'when user pass blank image' do
      before do
        params[:image] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end
  end
end
