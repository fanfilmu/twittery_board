require "rails_helper"

describe Twitter::TweetBuilder do
  let(:builder) { described_class.new }

  describe "#build" do
    subject { builder.build event }

    let(:event) do
      Fabricate :event,
        title:       "test title",
        description: "description example"
    end

    let(:expected_tweet_message) { "test title\ndescription example" }

    it "builds proper tweet message" do
      expect(subject).to eq expected_tweet_message
    end

    context "when built tweet message length greater than allowed" do
      let(:long_description) do
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit,"  \
        "sed do eiusmod tempor incididunt ut labore et dolore magna" \
        "aliqua. Ut enim ad minim veniam, quis nostrud exercitation" \
        "ullamco laboris nisi ut aliquip ex ea commodo consequat."
      end

      let(:event) do
        Fabricate :event,
          title:       "test title",
          description: long_description
      end

      let(:expected_tweet_message) do
        "test title\n" \
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit,"  \
        "sed do eiusmod tempor incididunt ut labore et dolore magna" \
        "aliqua. Ut ..."
      end

      it "truncates message to allowed length" do
        expect(subject).to eq expected_tweet_message
      end
    end
  end
end
