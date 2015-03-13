class CreateClassifiedAttachments < ActiveRecord::Migration
  def change
    create_table :classified_attachments do |t|
      t.string :picture
      t.references :classified, index: true
      t.timestamps null: false
    end
  end
end
