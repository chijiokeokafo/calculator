class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
    	t.string "rim"
    	t.string 'hub'
    	t.integer 'erd'
    	t.integer 'flange_diameter_left'
    	t.integer 'flange_diameter_right'
    	t.integer 'flange_center_left'
    	t.integer 'flange_center_right'
    	t.integer 'spoke_count'
    	t.integer 'spoke_hole_diameter'
    	t.integer 'spoke_crosses'


      t.timestamps null: false
    end
  end
end
