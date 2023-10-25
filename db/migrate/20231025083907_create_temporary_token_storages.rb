class CreateTemporaryTokenStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :temporary_token_storages do |t|
      t.string :email
      t.string :token
      t.integer :code
      t.timestamps
    end
  end
end
