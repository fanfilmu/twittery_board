require "rails_helper"

describe User do
  describe "fields" do
    %i(provider uid secret token).each do |field|
      it { should respond_to field }
    end
  end

  describe "associations" do
    it { should have_many :comments }
  end

  it_behaves_like "omniauthable"

  describe "#twitter" do
    subject { described_class.new token: "ABC", secret: "123" }
    let(:twitter_client) { double }

    before do
      allow(Twitter::REST::Client).to receive(:new).and_yield twitter_client
      ENV["TWITTER_API_KEY"]    = "API-123"
      ENV["TWITTER_APP_SECRET"] = "SEC-AAA"
    end

    it "assigns proper keys to client" do
      expect(twitter_client).to receive(:consumer_key=).with("API-123").and_return true
      expect(twitter_client).to receive(:consumer_secret=).with("SEC-AAA").and_return true
      expect(twitter_client).to receive(:access_token=).with("ABC").and_return true
      expect(twitter_client).to receive(:access_token_secret=).with("123").and_return true

      subject.twitter
    end
  end
end
