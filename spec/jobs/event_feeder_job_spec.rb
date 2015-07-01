require "rails_helper"

describe EventFeederJob do
  it "belongs to event_feeder queue" do
    expect(described_class.instance_variable_get("@queue")).to eq :event_feeder
  end

  describe ".perform" do
    subject { described_class.perform }
    let(:feeder) { double }

    before do
      allow(Twitter::EventFeeder).to receive(:new).and_return(feeder)
    end

    it "downloads the feed" do
      expect(feeder).to receive(:feed_all)
      subject
    end
  end
end
