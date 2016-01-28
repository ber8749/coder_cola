require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:admin)
    @order = orders(:one)
    @order.line_items.new
    @products = Product.all
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create order' do
    assert_difference('Order.count') do
      post :create, order: { status: @order.status, user_id: @order.user_id }
    end

    assert_redirected_to home_pages_path
  end

  test 'should show order' do
    get :show, id: @order
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @order
    assert_response :success
  end

  test 'should update order' do
    patch :update, id: @order, order: { status: @order.status, user_id: @order.user_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test 'should destroy order' do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
