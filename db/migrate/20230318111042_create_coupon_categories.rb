class CreateCouponCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_categories do |t|
      t.references :coupon, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
