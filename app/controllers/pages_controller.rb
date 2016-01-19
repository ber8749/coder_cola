class PagesController < ApplicationController
  def home
    set_coder_cola
    set_orders
    if user_signed_in?
      @order = Order.new
      @order.line_items.new
      @products = Product.all
    else
      @user = User.new
      @user.addresses.new
    end
  end
end
