
# require 'rails_helper'

# RSpec.describe Api::Orca::V1::SessionsController, type: :controller do
#   describe '#create' do
#     let(:password) { '12345678' }
#     let(:user) { create(:user, password: password) }
#     context 'correct' do
#       before(:each) { post :create, params: { email: user.email, password: password } }
#       it { expect(json[:auth_token]).to eq user.auth_token }
#     end

#     context 'incorrect email or password' do
#       it 'incorrect email' do
#         post :create, params: { email: "incorrect_#{user.email}", password: password }
#         expect(json.first[:error]).to eq 'error_with_your_email_or_password'
#       end

#       it 'incorrect password' do
#         post :create, params: { email: user.email, password: "incorrect_#{password}" }
#         expect(json.first[:error]).to eq 'error_with_your_email_or_password'
#       end
#     end

#     context 'missing parameter' do
#       it 'missing email' do
#         post :create, params: { password: password }
#         expect(json.first[:error]).to eq 'missing_parameter'
#       end

#       it 'missing password' do
#         post :create, params: { email: user.email }
#         expect(json.first[:error]).to eq 'missing_parameter'
#       end

#       it 'user blocked' do
#         user.block!
#         post :create, params: { email: user.email, password: password }
#         expect(json.first[:error]).to eq 'user_blocked'
#       end
#     end
#   end
# end


