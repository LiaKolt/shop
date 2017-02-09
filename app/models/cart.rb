class Cart < ApplicationRecord
  has_many :order_items

  def add_product(product_id)
    current_item= order_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity+=1
    else
      current_item = order_items.build(product_id: product_id)
    end
    current_item
  end

  def clear_cart
    order_items.each do |item|
      #item.cart_id = nil
      item.destroy
    end
  end

  def total_sum
      order_items.inject(0) { |sum, item| sum + item.total_sum }

  end
end