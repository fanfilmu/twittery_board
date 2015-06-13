class EventFeederJob
  @queue = :event_feeder

  def self.perform
    feeder = Twitter::EventFeeder.new
    feeder.feed_all
  end
end
