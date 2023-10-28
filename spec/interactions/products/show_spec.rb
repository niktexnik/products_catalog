require 'rails_helper'
RSpec.describe Products::Show do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let!(:product) { FactoryBot.create(:product) }
    let(:params) { { id: product.id } }

    it 'returns valid' do
      expect(run).to be_valid
      expect(run.result).to have_attributes(name: product.name, description: product.description,
                                            full_description: product.full_description)
      expect(run.result.image.identifier).to eq('sample.png')
    end

    context 'when user pass non existed id' do
      before do
        params[:id] = 9999
      end
      
      it 'returns exception ActiveRecord::RecordNotFound' do
      rescue ActiveRecord::RecordNotFound
        expect(run).to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when user pass not digits id' do
      before do
        params[:id] = 'ololo'
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end
  end
end
