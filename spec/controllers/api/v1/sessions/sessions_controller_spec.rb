require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'Create sessions and log in' do
    let(:user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }
    let(:storage) { FactoryBot.create(:temporary_token_storage) }
    let(:create_params) { { email: storage.email, token: storage.token, code: storage.code } }
    let(:login_params) { { email: 'lolol@ya.ru' } }
    before do
      REDIS_CURRENT.set(storage.email, storage.token, ex: 30)
    end

    describe 'POST #login' do
      it 'login' do
        post :login, params: login_params
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'create' do
        post :create, params: create_params
        expect(response).to have_http_status(:success)
      end
    end
  end
end
