class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
    @order=Order.new
  end

  def create
    redirect_to root_url, notice: 'ничего не вышло.'
  end

  def destroy
    @cart.clear_cart
    redirect_to cart_path, notice: 'Корзина пуста.'
  end

#  def destroy
#    @cart.destroy if @cart.id==session[:cart_id]
#    session[:cart_id] =nil
#    redirect_to root_path, notice: 'Корзина пуста.'
#
#  end


end
