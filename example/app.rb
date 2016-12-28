# app.rb
require 'sinatra/base'
require 'rack/ssl'
require 'creatubbles'
require 'json'

class CreatubblesExampleApplication < Sinatra::Base
  enable :sessions
  use Rack::SSL

  def authenticate!
    token = session['token']
    if token
      @current_user =
        begin
          @creatubbles_client.connect!(JSON.parse(token))
          @creatubbles_client.users.me
        rescue => err
          session['token'] = nil
          logger.info("Could not parse session token: #{err}")
          redirect to('/')
        end
    else
      redirect to('/sign_in')
    end
  end

  before do
    @creatubbles_client = Creatubbles::Client.new(
      client_id: ENV['CREATUBBLES_CLIENT_ID'],
      client_secret: ENV['CREATUBBLES_CLIENT_SECRET'],
      api_url: ENV['CREATUBBLES_API_URL'] || Creatubbles::DEFAULT_API_URL)
  end

  get '/' do
    @creations = @creatubbles_client.creations.recent
    @title = "Recent creations"
    erb :creations
  end

  get '/sign_in' do
    start_url = @creatubbles_client.start_code_flow(url('/callback'))
    logger.info("redirecting to Creatubbles: #{start_url}")
    redirect start_url
  end

  get '/callback' do
    @creatubbles_client.complete_code_flow(params[:code], url('/callback'))
    logger.info(@creatubbles_client.connection_hash.to_json)
    session['token'] = @creatubbles_client.connection_hash.to_json
    redirect to('/my/creations')
  end

  before '/my/*' do
    authenticate!
  end

  get '/my/creations' do
    @creations = @current_user.creations
    @title = "My creations"
    erb :creations
  end
end
