class UserCashback < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
  belongs_to :discount
end
