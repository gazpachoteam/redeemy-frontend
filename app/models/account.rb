class Account < ApplicationRecord
  belongs_to :customer
  has_many :points

  def nro_of_points
    points.map(&:cant_punt).inject(:+)
  end
end
