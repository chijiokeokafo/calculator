class User < ActiveRecord::Base
  has_many :posters
  has_many :classifieds, through: :posters

  has_many :reviews
  has_many :photos, through: :reviews
  has_many :builds

  has_many :likes

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :first_name, :last_name, :email, :password_confirmation, presence: true
  validates :email, uniqueness: true

  mount_uploader :profile_image, AvatarUploader

end
