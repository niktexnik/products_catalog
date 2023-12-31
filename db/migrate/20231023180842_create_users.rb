class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :auth_token
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
