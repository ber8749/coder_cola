class PagesController < ApplicationController
  def home
    if user_signed_in?
      @order = Order.new
      @order.line_items.new
      @products = Product.all
    else
      @resource = User.new
      @resource.addresses.new
    end
  end
end
