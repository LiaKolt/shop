class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def add_order_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end
end
