# frozen_string_literal: true

require 'webmock/rspec'
require 'factory_bot'
require 'faker'
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'housecanary'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
