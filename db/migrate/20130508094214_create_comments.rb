class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commenter

      t.timestamps
    end
    add_index :comments, :commenter_id
  end
end
