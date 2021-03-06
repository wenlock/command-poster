require "bundler/setup"
require "command/poster"
require 'webmock/rspec'
require 'vcr'
require 'support/fake_deployer'

WebMock.disable_net_connect!(:allow_localhost => true)

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  # c.ignore_hosts 'api.github.com'
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
