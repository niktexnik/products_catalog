# require 'swagger_helper'

# RSpec.describe 'api/v1/favourites', type: :request do
#   path '/api/v1/products/favourites' do
#     parameter name: 'id', in: :path, type: :integer, description: 'id'
#     parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
#     post('create favourite') do
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

#   path '/api/v1/products/favourites/{id}' do
#     # You'll want to customize the parameter types...
#     parameter name: 'id', in: :path, type: :integer, description: 'id'
#     parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'

#     delete('delete favourite') do
#       response(200, 'successful') do
#         let(:id) { '123' }

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
