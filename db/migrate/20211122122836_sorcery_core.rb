class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,             null: false
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.string :avatar
      t.integer :role, default: 0, null: false
      t.text :self_introduction

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
