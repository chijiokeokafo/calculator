class AddLatitudeAndLongitudeToClassifieds < ActiveRecord::Migration
  def change
  	add_column :classifieds, :latitude, :decimal, precision: 9, scale: 6
  	add_column :classifieds, :longitude, :decimal, precision: 9, scale: 6
  end
end
