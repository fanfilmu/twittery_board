require "rails_helper"

describe Comment do
  describe "fields" do
    it { should respond_to :content }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :commentable }
  end

  describe "validations" do
    %i(user commentable content).each do |field|
      it { should validate_presence_of field }
    end

    it { should validate_length_of(:content).is_at_most 500 }
  end
end
