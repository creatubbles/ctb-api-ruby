require 'oauth2'
require 'rspec'
require 'creatubbles'
require 'sinatra/base'
require 'webmock/rspec'
require 'pry'

Dir['spec/support/**/*.rb'].each do |f|
  require f.gsub('spec/', '').gsub('.rb', '')
end

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /api.creatubbles.com/).to_rack(Creatubbles::MockAPI)
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include CreationJson
  config.include UserJson
end
