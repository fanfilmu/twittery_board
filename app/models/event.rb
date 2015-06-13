class Event < ActiveRecord::Base
  has_many :comments, as: :commentable

  validates :title, :description, presence: true
  validates :description, length: { maximum: 1000 }

  def uploaded?
    tweet_id.present?
  end
end
