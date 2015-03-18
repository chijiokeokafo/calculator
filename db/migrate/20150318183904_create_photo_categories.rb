class CreatePhotoCategories < ActiveRecord::Migration
  def change
    create_table :photo_categories do |t|
      t.string :name
      t.timestamps null: false
    end

    add_column :photos, :photo_category_id, :integer
  end
end
