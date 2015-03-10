class Photo < ActiveRecord::Base
	def self.recent(n=5)
	  order("created_at DESC").limit(n)
	end
end
