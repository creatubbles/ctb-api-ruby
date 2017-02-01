require 'oauth2'
require 'rspec'
require 'creatubbles'

Dir['spec/support/**/*.rb'].each do |f|
  require f.gsub('spec/', '').gsub('.rb', '')
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end


RSpec.configure do |conf|
  include CreationJson
end
