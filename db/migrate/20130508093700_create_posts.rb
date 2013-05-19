class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tag
      t.text :content
      t.string :image
<<<<<<< HEAD
      t.timestamps
    end
=======

     t.references :user

    end

      t.timestamps
>>>>>>> 5813422d1ea70415f3ffb5d3c54c122989792f31
    end
  end
