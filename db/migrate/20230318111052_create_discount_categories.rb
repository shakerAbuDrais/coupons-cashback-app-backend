class CreateDiscountCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_categories do |t|
      t.references :discount, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
