module OrdersHelper
  def orders_shipped
    Order.shipped.count
  end
end
