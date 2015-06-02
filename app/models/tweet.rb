class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :tweet_id, :content, :author, :published_at, presence: true
end
