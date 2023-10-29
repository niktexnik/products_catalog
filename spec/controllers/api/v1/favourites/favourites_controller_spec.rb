require 'rails_helper'

RSpec.describe Api::V1::FavouritesController, type: :controller do
  describe 'User was authorized and has access to product CRUD' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:product) { FactoryBot.create(:product) }
    let(:params) { { product_id: product.id, user_id: user.id } }
    let(:favourite) { FactoryBot.create(:favourite) }

    before(:each) do
      cookies.encrypted['auth_token'] = user.auth_token
    end

    describe 'POST #create' do
      it 'creates a new product' do
        post :create, params: params
        expect(response).to have_http_status(:success)
      end
    end

    context 'User was unauthorized and didn\'t have access to product CRUD' do
      before(:each) do
        cookies.encrypted['auth_token'] = nil
      end

      describe 'POST #create' do
        it 'creates a new product' do
          post :create, params: params
          expect(response).to have_http_status(:unauthorized)
        end
      end

      describe 'DELETE #destroy' do
        it 'deletes favourite products' do
          delete :destroy, params: { id: favourite.id, user_id: favourite.user_id }
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
