class OrderItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def new

  end

  def show

  end

  def create
    product = Product.find(params[:product_id])
    @order_item = @cart.add_product(product.id)
    logger.info "сохранение"
    logger.info "id"
    logger.info @order_item.id
    logger.info "cart"
    logger.info @order_item.cart_id
    logger.info "product"
    logger.info @order_item.product_id
    if @order_item.save
      redirect_to root_path
    else
      render action: 'new'


    end
  end

  def destroy
    @cart =Cart.find(@order_item.cart.id)
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url(cart_id: @cart.id), notice: 'Order-item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:product_id)
  end
end