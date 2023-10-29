
require 'rails_helper'
require 'byebug'

RSpec.describe Favourites::Destroy do
  subject(:interaction) { described_class }

  describe '.run' do
    subject(:run) { interaction.run(params) }

    let!(:favourite) { FactoryBot.create(:favourite) }
    let(:params) { { id: favourite.product_id, user_id: favourite.user_id } }

    it 'returns valid' do
      expect(run).to be_valid
    end

    context 'when product_id is invalid' do
      it 'returns invalid when id is a string' do
        params[:id] = 'lol'
        expect(run).to be_invalid
      end

      it 'returns invalid when id is not found' do
        params[:id] = 99999
        expect(run).to be_invalid
      end

      it 'returns invalid when id is missing' do
        params.delete(:id)
        expect(run).to be_invalid
      end
    end

    context 'when user_id is invalid' do
      it 'returns invalid when user_id is a string' do
        params[:user_id] = 'lol'
        expect(run).to be_invalid
      end

      it 'returns invalid when user_id is not found' do
        params[:user_id] = 99999
        expect(run).to be_invalid
      end

      it 'returns invalid when user_id is missing' do
        params.delete(:user_id)
        expect(run).to be_invalid
      end
    end
  end
end
