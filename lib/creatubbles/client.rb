require "oauth2"

class Creatubbles::Client
  attr_writer :api_url, :username, :password

  def initialize(client_id: nil, client_secret: nil, username: nil, password: nil, api_url: Creatubbles::DEFAULT_API_URL)
    @client_id = client_id
    @client_secret = client_secret
    @username = username
    @password = password
    @api_url = api_url
  end

  def connection
    @connection ||= get_oauth_token
  end

  def disconnect!
    @connection = nil
  end

  Creatubbles.type_collection_classes.each do |type_name, collection_class|
    class_eval <<-EOM, __FILE__, __LINE__ + 1
      def #{type_name}
        #{collection_class.name}.new(connection)
      end
    EOM
  end

  private

  def get_oauth_token
    oauth = OAuth2::Client.new(@client_id, @client_secret, site: @api_url)
    if @username && @password
      oauth.password.get_token(@username, @password)
    else
      oauth.client_credentials.get_token
    end
  end
end
