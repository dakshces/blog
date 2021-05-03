class Blogpost < ApplicationRecord
  belongs_to :user
  serialize :tags,Array
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true
  validates :user_id, presence: true
end
