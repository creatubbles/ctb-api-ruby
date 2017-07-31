module Creatubbles
  class Client

    def self.dummy_auth_details
      {
        client_id: "dummy_id",
        client_secret: "dummy_secret",
        api_url: "https://api.creatubbles.com/v2"
      }
    end

    def self.dummy
      new(dummy_auth_details)
    end

    Creatubbles::BaseCollection.define_type_name('test_objects')

    def test_objects
      Creatubbles::BaseCollection.new(connection)
    end
  end
end
