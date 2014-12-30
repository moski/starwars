require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage(90)
end

require 'starwars'
require 'rspec'
require 'webmock/rspec'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

WebMock.disable_net_connect!(allow: %w(codeclimate.com coveralls.io))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Starwars::Base::BASE_URL + path)
end

def stub_get(path)
  stub_request(:get, Starwars::Base::BASE_URL + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
