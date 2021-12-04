class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :commetns, source: :post

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name, :password, presence: true

  def is_favorite?(post)
    favorite_posts.include?(post)
  end

  def is_mine?(object)
    object.user_id == id
  end
end