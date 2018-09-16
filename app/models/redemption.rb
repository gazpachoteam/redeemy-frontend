class Redemption < ApplicationRecord
  belongs_to :customer
  belongs_to :redeemable
end
