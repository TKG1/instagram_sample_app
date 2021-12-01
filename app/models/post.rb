class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :post_image, PostImageUploader

end
