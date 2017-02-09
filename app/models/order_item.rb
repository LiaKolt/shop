class OrderItem < ApplicationRecord
  #belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_sum
    product.price* quantity
  end

end
