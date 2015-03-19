class CreateClassifiedCategories < ActiveRecord::Migration
  def change
    create_table :classified_categories do |t|
      t.string :name 
      t.timestamps null: false
    end
  end
end
