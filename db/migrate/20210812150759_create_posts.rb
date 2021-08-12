class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tag
      t.references :users, index: true, foreign_key: true
      t.references :categories, index: true, foreign_key: true
      t.timestamps
    end
  end
end
