class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tag
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
