class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  

  mount_uploader :avatar, AvatarUploader

	def self.recent(n=5)
	  order("created_at DESC").limit(n)
	end
end
