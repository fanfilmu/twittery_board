module Twitter
  class AdminClient < Twitter::REST::Client
    def initialize
      super do |config|
        config.consumer_key        = ENV["TWITTER_API_KEY"]
        config.consumer_secret     = ENV["TWITTER_APP_SECRET"]
        config.access_token        = ENV["TWITTER_APP_TOKEN"]
        config.access_token_secret = ENV["TWITTER_APP_TOKEN_SECRET"]
      end
    end
  end
end
