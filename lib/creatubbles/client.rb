require "oauth2"

class Creatubbles::Client
  attr_writer :api_url, :username, :password

  def self.new_from_env
    auth_details = Creatubbles::Utils::AuthDetails.from_env
    missing = auth_details.select{|_k,v| ['',nil].include?(v) }
    if missing.empty?
      new(auth_details)
    else
      raise "Can't init Creatubbles::Client ! Missing: #{missing.keys.join(',')}"
    end
  end

  def initialize(client_id: nil, client_secret: nil, username: nil, password: nil, api_url: Creatubbles::DEFAULT_API_URL, scope: nil)
    @client_id = client_id
    @client_secret = client_secret
    @username = username
    @password = password
    @api_url = api_url
    @scope = scope
  end

  def connection
    @connection ||= get_oauth_token
  end

  def connect!(hash)
    @connection = OAuth2::AccessToken.from_hash(oauth_client, hash)
  end

  def connection_hash
    @connection.to_hash
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

  def start_code_flow(redirect_uri='urn:ietf:wg:oauth:2.0:oob')
    oauth_client.auth_code.authorize_url(redirect_uri: redirect_uri)
  end

  def complete_code_flow(code_value, redirect_uri='urn:ietf:wg:oauth:2.0:oob')
    @connection = oauth_client.auth_code.get_token(code_value, redirect_uri: redirect_uri)
  end

  private

  def get_oauth_token
    if @username && @password
      oauth_client.password.get_token(@username, @password, scope: @scope)
    else
      oauth_client.client_credentials.get_token(scope: @scope)
    end
  end

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(@client_id, @client_secret, site: @api_url)
  end
end
