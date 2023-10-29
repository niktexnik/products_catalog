require 'rails_helper'

RSpec.describe Favourites::Create do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let(:user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }
    let(:params) { { user_id: user.id, product_id: product.id } }

    it 'returns valid' do
      expect(run).to be_valid
    end

    context 'when user id - empty' do
      before do
        params.delete(:user_id)
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

    context 'when user_name empty' do
      before do
        params.delete(:product_id)
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

    context 'when user_id and product_id empty' do
      before do
        params[:user_id], params[:product_id] = nil
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

  end
end
