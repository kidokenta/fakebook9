class Post < ApplicationRecord
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end


