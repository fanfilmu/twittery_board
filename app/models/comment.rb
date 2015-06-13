class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true, unless: :from_twitter?
  validates :commentable, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  def from_twitter?
    tweet_id.present?
  end
end
