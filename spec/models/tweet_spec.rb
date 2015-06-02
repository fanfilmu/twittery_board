require "rails_helper"

describe Tweet do
  FIELDS = %i(tweet_id content author published_at)

  describe "fields" do
    FIELDS.each do |field_name|
      it { should respond_to field_name }
    end
  end

  describe "validations" do
    FIELDS.each do |field_name|
      it { should validate_presence_of field_name }
    end
  end
end
