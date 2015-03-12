class User < ActiveRecord::Base
  has_many :classifieds
  has_many :reviews
  has_many :photos, through: :reviews 

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, uniqueness: true

  mount_uploader :profile_image, AvatarUploader

end
