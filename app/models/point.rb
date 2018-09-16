class Point < ApplicationRecord
  belongs_to :account
  belongs_to :point_type
end
