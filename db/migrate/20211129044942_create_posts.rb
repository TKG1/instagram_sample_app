class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :post_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
