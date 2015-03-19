class AddClassifiedCategoryIdToClassified < ActiveRecord::Migration
  def change
  add_column :classifieds, :classified_category_id, :integer
  end
end
