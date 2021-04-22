class Blogpost < ApplicationRecord
  serialize :tags,Array
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true
end
