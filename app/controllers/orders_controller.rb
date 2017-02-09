class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]

  def new
    #сюда не заходит
    if @cart.order_items.empty?

      redirect_to cart_url(@cart), notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  def create
    if @cart.order_items.empty?
      redirect_to cart_url(@cart), notice: "Не возможно сформировать заказ - корзина пуста"
    else

      @order=Order.new(order_params)
      @order.add_order_items_from_cart(@cart)


      if @order.save
        OrderConfirmationMailer.order_email(@order).deliver_later

        Cart.destroy(session[:cart_id])
        session[:cart_id] =nil
        redirect_to root_url, notice: "Ваш заказ отправлен"
      else
        redirect_to root_url, notice: "не записано"

      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :email)
  end
end
