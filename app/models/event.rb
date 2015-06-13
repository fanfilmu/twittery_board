class Event < ActiveRecord::Base
  has_many :comments, as: :commentable

  validates :title, :description, presence: true
  validates :description, length: { maximum: 1000 }

  scope :uploaded, -> { where.not(tweet_id: nil) }

  def uploaded?
    tweet_id.present?
  end
end
