# require 'swagger_helper'

# RSpec.describe 'api/v1/products', type: :request do

#   path '/api/v1/products' do

#     get('list products') do
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

#     post('create product') do
#       parameter name: 'name', in: :path, type: :string, description: 'name'
#       parameter name: 'description', in: :path, type: :string, description: 'description'
#       parameter name: 'full_description', in: :path, type: :string, description: 'full description'
#       parameter name: 'image', in: :path, type: :file, description: 'image'
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

#   path '/api/v1/products/{id}' do
#     # You'll want to customize the parameter types...
#     parameter name: 'id', in: :path, type: :string, description: 'id'

#     get('show product') do
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

#     patch('update product') do
#       parameter name: 'name', in: :path, type: :string, required: false, description: 'name'
#       parameter name: 'description', in: :path, type: :string, required: false, description: 'description'
#       parameter name: 'full_description', in: :path, type: :string, required: false, description: 'full description'
#       parameter name: 'image', in: :path, type: :file, required: false, description: 'image'

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

#     delete('delete product') do
#       parameter name: 'id', in: :path, type: :string, description: 'id'
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
