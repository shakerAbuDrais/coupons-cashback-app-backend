class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :store, null: false, foreign_key: true
      t.text :description
      t.integer :discount_percentage
      t.datetime :start_date
      t.datetime :end_date
      t.integer :cashback_percentage

      t.timestamps
    end
  end
end
