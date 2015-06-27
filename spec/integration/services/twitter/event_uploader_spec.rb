require "rails_helper"

describe Twitter::EventUploader, :vcr do
  subject { described_class.new }

  describe "#upload" do
    let(:event) { Fabricate :event }

    it "uploads tweet and stores assigned tweet id in event" do
      subject.upload event
      event.reload

      expect(event.tweet_id).to eq "614785577775460352"
    end

    it "returns uploaded tweet" do
      tweet = subject.upload event

      expect(tweet.id).to eq 614785581432893440
    end
  end
end
