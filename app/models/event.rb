class Event < ActiveRecord::Base
  has_many :comments, as: :commentable

  validates :title, :description, presence: true
  validates :description, length: { maximum: 1000 }
end
