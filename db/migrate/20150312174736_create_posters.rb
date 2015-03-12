class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.integer :user_id
      t.integer :classified_id
      t.text :message
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
