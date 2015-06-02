require "rails_helper"

describe Event do
  describe "fields" do
    %i(title description).each do |field|
      it { should respond_to field }
    end
  end

  describe "associations" do
    it { should have_many :comments }
  end
end
