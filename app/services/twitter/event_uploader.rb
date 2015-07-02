module Twitter
  class EventUploader
    attr_reader :client

    def initialize(client = ::Twitter::AdminClient.new)
      raise ArgumentError.new "Missing client" unless client

      @client = client
    end

    def upload(event)
      tweet_message = tweet_builder.build event

      tweet = nil

      ::ActiveRecord::Base.transaction do
        tweet = client.update tweet_message

        event.tweet_id = tweet.id.to_s
        event.save!
      end

      tweet
    end

    def upload_all(events)
      events.map { |event| upload(event) }
    end

    private

    def tweet_builder
      @tweet_builder ||= TweetBuilder.new
    end
  end
end
