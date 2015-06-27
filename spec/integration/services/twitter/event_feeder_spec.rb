require "rails_helper"

describe Twitter::EventFeeder, :vcr do
  subject { described_class.new }

  describe "#feed" do
    let(:event) { Fabricate :event, tweet_id: "614790909973168128" }

    it "fetches and stores event tweet comments" do
      expect { subject.feed event }.to change(event.comments, :count).by 3

      expected_tweet_ids = %w(614793637914902528
                              614793665366650881
                              614796338761441280)

      expect(event.comments.map &:tweet_id).to include *expected_tweet_ids
    end

    it "normalizes tweet content" do
      subject.feed event

      expected_comment_contents = [
        "Test comment #1",
        "Test comment #2",
        "Test comment #3"
      ]

      expect(event.comments.map &:content).to include *expected_comment_contents
    end
  end
end
