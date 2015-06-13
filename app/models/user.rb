class User < ActiveRecord::Base
  extend Omniauthable

  has_many :comments

  devise :rememberable, :omniauthable, omniauth_providers: [:twitter]

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_APP_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
