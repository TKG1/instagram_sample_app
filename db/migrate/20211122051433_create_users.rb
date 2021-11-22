class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :avatar
      t.integer :role, default: 0, null: false
      t.text :self_introduction

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
