require "rails_helper"

describe Comment do
  describe "fields" do
    it { should respond_to :content }
  end

  describe "associations" do
    it { should belong_to :commentable }
  end

  describe "validations" do
    %i(commentable content).each do |field|
      it { should validate_presence_of field }
    end

    it { should validate_length_of(:content).is_at_most 500 }

    context "when from twitter" do
      before { allow(subject).to receive(:from_twitter?).and_return true }

      it { should_not validate_presence_of :user }
    end

    context "when not from twitter" do
      before { allow(subject).to receive(:from_twitter?).and_return false }

      it { should validate_presence_of :user }
    end
  end
end
