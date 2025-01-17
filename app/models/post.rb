class Post < ApplicationRecord
  validates_presence_of :title, :description
  has_one_attached :image
  has_many :comments, dependent: :destroy

  belongs_to :user
end
