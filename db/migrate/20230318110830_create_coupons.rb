class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :store, null: false, foreign_key: true
      t.string :coupon_code
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :cashback_percentage

      t.timestamps
    end
  end
end
