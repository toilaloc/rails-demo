class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :password_digest
      t.string :email
      t.string :address
      t.string :avatar

      t.timestamps
    end
  end
end
