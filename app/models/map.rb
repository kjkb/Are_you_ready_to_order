class Map < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :shop_name, presence: true
  validates :body, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :cooking_genre, presence: true
  validates :peko, presence: true
   
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end
   
end