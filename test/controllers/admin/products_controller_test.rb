require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  include  Devise::Test::ControllerHelpers

  setup do
    @product = products(:one)
    #@user = admins(:one)
    #@user = Admin.where(email: "123123@test.com")
    @user = admins :one
    @user.confirm
    sign_in @user

  end

  test "should get index" do
    get admin_products_path
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_path
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post admin_products_url, params: { product: { description: @product.description, price: @product.price, title: @product.title } }
    end

    assert_redirected_to admin_product_url(Product.last)
  end

  test "should show product" do
    get admin_product_path(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_path(@product)
    assert_response :success
  end

  test "should update product" do
    patch admin_product_url(@product), params: { product: { description: @product.description, price: @product.price, title: @product.title } }
    assert_redirected_to admin_product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete admin_product_url(@product)
    end

    assert_redirected_to admin_products_url
  end
end
