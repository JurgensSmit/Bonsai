class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tag
      t.text :content
      t.string :image
     t.references :user

      t.timestamps
    end

    add_index :posts, :user_id
  end
end
