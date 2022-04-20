class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:name]
 
  has_many :maps, dependent: :destroy
  has_many :favorites, dependent: :destroy
 
  validates :name, presence: true
  validates :email,  length: { maximum: 30 }

end
