class Post < ApplicationRecord
  validates_presence_of :title, :description
  has_one_attached :image

  belongs_to :user
end
