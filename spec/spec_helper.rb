require "bundler/setup"
require "capybara_click_at"

require 'capybara/dsl'
include Capybara::DSL

require 'pry'
require 'rack/file'
Capybara.app = Rack::File.new File.expand_path('../fixtures', __FILE__)

require 'selenium-webdriver'
require 'capybara-webkit'
require 'capybara/poltergeist'
Capybara.default_driver = :selenium

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include CapybaraClickAt
end

RSpec.configure do |config|
  config.around(:each) do |example|
    if driver = example.metadata[:driver]
      Capybara.current_driver = driver
    end

    example.run

    Capybara.use_default_driver
  end
end

Capybara::Webkit.configure do |config|
  config.allow_url("rawgit.com")
  config.allow_url("raw.githubusercontent.com")
end
