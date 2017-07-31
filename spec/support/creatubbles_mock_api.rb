require 'spec_helper'

module Creatubbles
  class MockAPI < Sinatra::Base
    set :port, 3000

    # put class variables here
    # you cannot use @var in Sinatra::Base
    configure do
    end

    # return a preset access token
    post '/oauth/token' do
      headers "Content-Type" => 'application/json'
      {"access_token" => "a8c814aa3cee2d5cdca997a314dca206335c119e7121e954a7c6f17592caa33d", "token_type" => "bearer", "created_at" => 1479918313}.to_json
    end

    post '/v2/oauth/token' do
      headers "Content-Type" => 'application/json'
      {"access_token" => "a8c814aa3cee2d5cdca997a314dca206335c119e7121e954a7c6f17592caa33d", "token_type" => "bearer", "created_at" => 1479918313}.to_json
    end

    # get a non existing object
    get '/v2/test_objects/non-existing-object-id' do
      status 404
      headers "Content-Type" => 'application/json'
      "{\"errors\":[{\"status\":\"404\",\"code\":\"not_found\",\"source\":\"https://api.creatubbles.com/v2/objects/non-existing-creation-id\",\"title\":\"Not found\",\"detail\":\"Record not found\"}]}"
    end

  end
end

# To run the moch as a separate process:
# Creatubbles::MockAPI.run!
