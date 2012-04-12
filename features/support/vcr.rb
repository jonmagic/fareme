require 'webmock/cucumber'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path('../../../spec/fixtures/cassette_library', __FILE__)
  c.hook_into :webmock
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :new_episodes }
end