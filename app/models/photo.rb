class Photo < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

	def self.recent(n=5)
	  order("created_at DESC").limit(n)
	end
end
