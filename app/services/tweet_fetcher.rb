class TweetFetcher
  attr_reader :creator

  def initialize(creator)
    raise ArgumentError.new "Missing creator user" unless creator

    @creator = creator
  end

  def fetch(user = creator.uid.to_i, count: 10)
    creator.twitter.user_timeline(user, count: count).map do |tweet|
      creator.tweets.find_or_create_by normalized_tweet(tweet)
    end
  end

  private

  def normalized_tweet(tweet)
    {
      tweet_id:     tweet.id,
      content:      tweet.text,
      author:       tweet.user.screen_name,
      published_at: tweet.created_at
    }
  end
end
