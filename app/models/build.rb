class Build < ActiveRecord::Base
	validates :rim, :hub, presence: true
	validates :erd, :flange_diameter_left, :flange_diameter_right, :flange_center_right, :flange_center_left, :spoke_hole_diameter, :spoke_count, :spoke_crosses, presence: true
	validates :erd, :flange_diameter_left, :flange_diameter_right, :flange_center_right, :flange_center_left, :spoke_hole_diameter, :spoke_count, :spoke_crosses, numericality: true

	def spoke_length_right
		spoke_length(flange_radius_right, flange_center_right).round(2)
	end

	def spoke_length_left
		spoke_length(flange_radius_left, flange_center_left).round(2)
	end

	def rim_radius
		erd/2
	end

	def flange_radius_right
		flange_diameter_right/2
	end

	def flange_radius_left
		flange_diameter_left/2
	end

	def spoke_length(flange_radius, flange_center)
		Math.sqrt(rim_radius ** 2 + flange_radius ** 2 + flange_center ** 2 - 2 * rim_radius * flange_radius * Math.cos(720 * spoke_crosses * Math::PI / 180 * spoke_count)) - (spoke_hole_diameter / 2)
	end

	def cos_top
		720 * spoke_crosses * Math::PI
	end

	def cos_btm
		180 * spoke_count
	end

	def cosFunc
		Math.cos(cos_top / cos_btm)
	end 

	def spoke_length(flange_radius, flange_center)
		Math.sqrt(rim_radius ** 2 + flange_radius ** 2 + flange_center ** 2 - 2 * rim_radius * flange_radius * cosFunc) - (spoke_hole_diameter / 2)
	end
end
