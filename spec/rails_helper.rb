ENV['RAILS_ENV'] ||= 'test'.freeze
require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
# require 'pundit/matchers'
# require 'devise'
# require 'sidekiq/testing'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
# Sidekiq::Testing.fake!

RSpec.configure do |config|
  # Ensure that if we are running js tests, we are using latest webpack assets
  # This will use the defaults of :js and :server_rendering meta tags
#   ReactOnRails::TestHelper.configure_rspec_to_compile_assets(config)

  # Ensure that if we are running js tests, we are using latest webpack assets
  # This will use the defaults of :js and :server_rendering meta tags
#   ReactOnRails::TestHelper.configure_rspec_to_compile_assets(config)

#   config.fixture_path = "#{Rails.root}/spec/fixtures"

#   config.use_transactional_fixtures = true

#   config.infer_spec_type_from_file_location!

#   config.render_views = true

#   config.include Requests::JsonHelpers, type: :controller
#   config.include ServiceHelpers, type: :controller
#   config.include FileHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    # Rails.application.load_seed
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    # Sidekiq::Queues.clear_all
  end

#   config.after(:all) do
#     FileUtils.rm_rf(Dir["#{Rails.root}/public/spec_uploads"]) if Rails.env.test?
#   end

#   config.include Devise::Test::ControllerHelpers, type: :controller
#   config.include Devise::Test::IntegrationHelpers, type: :feature
#   config.extend ControllerMacros, type: :controller
end
