class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.string :email
      t.string :city
      t.integer :user_id 
      t.string :picture
      t.timestamps null: false
    end
  end
end
