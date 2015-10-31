ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

	auth_hash = {
	  provider: 'twitter',
		uid: '123545',
		info: {
			name: 'Eric Cartman',
			image: 'http://placehold.it/100x100'
		},
		credentials: {token: 'XXX', secret: 'XXX'}
	}

	config.before do
		OmniAuth.config.test_mode = true
		OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(auth_hash)
	end

	config.after do
	  OmniAuth.config.mock_auth[:twitter] = nil
	end
end
