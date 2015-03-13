class RemovePictureFromClassified < ActiveRecord::Migration
  def change
    remove_column :classifieds, :picture
  end
end
