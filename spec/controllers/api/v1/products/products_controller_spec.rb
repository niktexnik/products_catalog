require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'User was authorized and have access to product CRUD' do
    let(:current_user) { create(:user) }
    let(:product_params) { { name: 'New Product', description: 'ololo', full_description: 'lolololololollololollo',
                             image: Rails.root.join('spec/fixtures/files/images/sample.png').open } }
    let(:updated_params) { { name: 'Updated Product', description: 'Updated Product lol',
                             full_description: 'Updated Product lolololololollololollo' } }
    describe 'GET #index products' do
      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns a successful response' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'create a new product' do
        post :create, params: { product: product_params }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PUT #update' do
      it 'updates an existing product' do
        existing_product = Product.last
        put :update, params: { id: existing_product.id, product: updated_params }
        expect(response).to have_http_status(:success)

      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an existing product' do
        existing_product = Product.last

        delete :destroy, params: { id: existing_product.id }
        expect(response).to have_http_status(:no_content)

      end
    end
  end

  describe 'User was unauthorized and didn\'t have access to product CRUD' do
    @current_user = nil
    let(:product_params) { { name: 'New Product', description: 'ololo', full_description: 'lolololololollololollo',
                              image: Rails.root.join('spec/fixtures/files/images/sample.png').open } }
    let(:updated_params) { { name: 'Updated Product', description: 'Updated Product lol',
                              full_description: 'Updated Product lolololololollololollo' } }
    describe 'GET #index products' do
      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET #show' do
      it 'returns a successful response' do
        get :show, params: { id: 1 }
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
        existing_product = Product.last
        put :update, params: { id: existing_product.id, product: updated_params }
        expect(response).to have_http_status(:unauthorized)

      end
    end

    describe 'DELETE #destroy' do
      it 'deletes an existing product' do
        existing_product = Product.last

        delete :destroy, params: { id: existing_product.id }
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
