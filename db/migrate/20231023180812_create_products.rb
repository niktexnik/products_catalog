class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :full_description
      t.string :image
      t.timestamps
    end
  end
end
