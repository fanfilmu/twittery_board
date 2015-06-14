require "rails_helper"

shared_examples_for "omniauthable" do
  let(:auth_data) do
    OpenStruct.new uid: "213ADW", provider: "twitter", credentials: OpenStruct.new(secret: "Az46", token: "2165")
  end

  describe ".from_omniauth" do
    subject { described_class.from_omniauth(auth_data) }

    context "when Omniauthable object does not exist" do
      let(:dummy) { double }

      before do
        association = double
        allow(described_class).to receive(:where).with(provider: "twitter", uid: "213ADW").and_return(association)
        allow(association).to receive(:first_or_create).and_yield(dummy)
      end

      it "should create new object" do
        expect(dummy).to receive(:provider=).with("twitter")
        expect(dummy).to receive(:uid=).with("213ADW")
        expect(dummy).to receive(:secret=).with("Az46")
        expect(dummy).to receive(:token=).with("2165")

        subject
      end
    end

    context "when Omniauthable object exists" do
      let(:dummy) { double }

      before do
        association = double
        allow(described_class).to receive(:where).with(provider: "twitter", uid: "213ADW").and_return(association)
        allow(association).to receive(:first_or_create).and_return(dummy)
      end

      it "should create new object" do
        expect(dummy).not_to receive(:provider=).with("twitter")
        expect(dummy).not_to receive(:uid=).with("213ADW")
        expect(dummy).not_to receive(:secret=).with("Az46")
        expect(dummy).not_to receive(:token=).with("2165")

        expect(subject).to eq dummy
      end
    end
  end
end
