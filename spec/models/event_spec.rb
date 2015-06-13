require "rails_helper"

describe Event do
  describe "fields" do
    %i(title description).each do |field|
      it { should respond_to field }
    end
  end

  describe "validations" do
    %i(title description).each do |field|
      it { should validate_presence_of field }
    end

    it { should validate_length_of(:description).is_at_most 1000 }
  end

  describe "associations" do
    it { should have_many :comments }
  end
end
