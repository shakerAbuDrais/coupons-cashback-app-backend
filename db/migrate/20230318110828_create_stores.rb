class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_url
      t.string :store_logo
      t.text :store_description

      t.timestamps
    end
  end
end
