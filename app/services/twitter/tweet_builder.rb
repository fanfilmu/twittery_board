module Twitter
  class TweetBuilder
    MAX_MESSAGE_LENGTH = 140

    def build(event)
      "#{event.title}\n#{event.description}".truncate(MAX_MESSAGE_LENGTH)
    end
  end
end
