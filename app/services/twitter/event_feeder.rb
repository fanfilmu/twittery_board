module Twitter
  class EventFeeder
    attr_reader :client

    def initialize(client = ::Twitter::AdminClient.new)
      raise ArgumentError.new "Missing client" unless client

      @client = client
    end

    def feed(event)
      return unless event.uploaded?

      fetch_feed(event).each do |tweet|
        unless event.comments.exists?(tweet_id: tweet.id)
          event.comments << build_comment(tweet)
        end
      end

      event.save!
    end

    def feed_all
      Event.uploaded.each { |event| feed(event) }
    end

    private

    def build_comment(tweet)
      Comment.new(content: normalized_tweet_text(tweet.text), tweet_id: tweet.id)
    end

    def fetch_feed(event)
      client.mentions_timeline.select do |tweet|
        tweet.in_reply_to_tweet_id == event.tweet_id.to_i
      end
    rescue Twitter::Error::Unauthorized
      []
    end

    def normalized_tweet_text(text)
      text.sub /^@\w+/, ""
    end
  end
end
