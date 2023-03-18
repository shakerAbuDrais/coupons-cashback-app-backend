class CreateUserCashbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_cashbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :cashback_amount
      t.references :coupon, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
