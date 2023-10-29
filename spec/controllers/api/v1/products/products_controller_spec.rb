require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'User was authorized and has access to product CRUD' do
    let(:user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }
    let(:product_params) { { name: 'New Product', description: 'New Product', full_description: 'New Product',
                             image: Rails.root.join('spec/fixtures/files/images/sample.jpg').open } }
    let(:updated_params) { { name: 'Updated Product', description: 'Updated Product', full_description: 'Updated Produ',
                             image: Rails.root.join('spec/fixtures/files/images/sample2.jpg').open } }

    before(:each) do
      cookies.encrypted['auth_token'] = user.auth_token
    end

    describe 'GET #index products' do
      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns a successful response' do
        get :show, params: { id: product.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'creates a new product' do
        post :create, params: product_params
        expect(response).to have_http_status(:bad_request)
      end
    end

    describe 'PUT #update' do
      it 'updates an existing product' do
        put :update, params: { id: product.id, product: updated_params }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an existing product' do
        delete :destroy, params: { id: product.id }
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'User was unauthorized and didn\'t have access to product CRUD' do
      before(:each) do
        cookies.encrypted['auth_token'] = nil
      end

      describe 'GET #index products' do
        it 'returns a successful response' do
          get :index
          expect(response).to have_http_status(:unauthorized)
        end
      end

      describe 'GET #show' do
        it 'returns a successful response' do
          get :show, params: { id: product.id }
          expect(response).to have_http_status(:unauthorized)
        end
      end

      describe 'POST #create' do
        it 'create a new product' do
          post :create, params: { product: product_params }
          expect(response).to have_http_status(:unauthorized)
        end
      end

      describe 'PUT #update' do
        it 'updates an existing product' do
          put :update, params: { id: product.id, product: updated_params }
          expect(response).to have_http_status(:unauthorized)

        end
      end

      describe 'DELETE #destroy' do
        it 'deletes an existing product' do
          delete :destroy, params: { id: product.id }
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
