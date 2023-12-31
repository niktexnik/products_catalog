require 'rails_helper'

RSpec.describe Products::Create do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let(:params) { { name: 'Product',
                     description: 'Description', full_description: 'Full description',
                     image: Rails.root.join('spec/fixtures/files/images/sample.jpg').open } }

    it 'returns valid' do
      expect(run).to be_valid
      expect(run.result).to have_attributes(name: 'Product', description: 'Description', full_description: 'Full description')
      expect(run.result.image.identifier).to eq('sample.jpg')
    end

    context 'when user not pass name' do
      before do
        params.delete(:name)
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
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
      
      it 'returns invalid' do
        expect(run).to be_invalid
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
      
      it 'returns invalid' do
        expect(run).to be_invalid
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
      
      it 'returns invalid' do
        expect(run).to be_invalid
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
