require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item = order_items(:one)
   end

  test "should update order_item" do
 #    patch :update, id: @order_item, order_item: { product_id: @order_item.product_id }
 #   assert_redirected_to order_item_path(assigns(:order_item))
  end
end
