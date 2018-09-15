class Provider < ApplicationRecord
  has_many :redeemables, dependent: :destroy
end
