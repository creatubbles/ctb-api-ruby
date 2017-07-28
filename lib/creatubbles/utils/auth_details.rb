# Creatubbles::Utils::AuthDetails
module Creatubbles
  module Utils
    class AuthDetails
      def self.from_env
        {
          client_id: ENV['CREATUBBLES_CLIENT_ID'],
          client_secret: ENV['CREATUBBLES_CLIENT_SECRET'],
          api_url: ENV['CREATUBBLES_API_URL'] || Creatubbles::DEFAULT_API_URL,
          username: ENV['CREATUBBLES_USERNAME'],
          password: ENV['CREATUBBLES_PASSWORD']
        }
      end

      def self.option_parser_env_explain opt
        opt.separator  "     CREATUBBLES_CLIENT_ID: application client ID"
        opt.separator  "     CREATUBBLES_CLIENT_SECRET: application client secret"
        opt.separator  "     CREATUBBLES_USERNAME: user's email"
        opt.separator  "     CREATUBBLES_PASSWORD: user's password"
        opt.separator  "     CREATUBBLES_API_URL: API URL (default: #{Creatubbles::DEFAULT_API_URL})"
      end

      def self.option_parser_handle(opt,auth_details)
        opt.on("-c","--cid CLIENT_ID","application client ID") do |cid|
          auth_details[:client_id] = cid
        end
        opt.on("-s","--cis CLIENT_SECRET","application secret") do |cis|
          auth_details[:client_secret] = cis
        end
        opt.on("-u","--username EMAIL","User's email") do |email|
          auth_details[:username] = email
        end
        opt.on("-p","--password PASSWORD","user's password") do |password|
          auth_details[:password] = password
        end
        opt.on("-a","--api API_URL","API URL (default: #{Creatubbles::DEFAULT_API_URL})") do |api_url|
          auth_details[:api_url] = api_url
        end
      end
    end
  end
end
