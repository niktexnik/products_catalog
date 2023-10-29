# require 'swagger_helper'

# RSpec.describe 'api/v1/sessions', type: :request do

#   path '/api/v1/login' do
#     parameter name: 'email', in: :path, type: :integer, description: 'email'
#     post('login session') do
#       response(200, 'successful') do

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/create' do
#     parameter name: 'email', in: :path, type: :string, description: 'email'
#     parameter name: 'code', in: :path, type: :integer, description: 'code'
#     parameter name: 'token', in: :path, type: :string, description: 'token'

#     post('create session') do
#       response(200, 'successful') do

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/destroy' do

#     post('delete session') do
#       response(200, 'successful') do

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end
# end
