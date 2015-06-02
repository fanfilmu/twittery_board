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
end
