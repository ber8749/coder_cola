module OrdersHelper
  def feed_address(address)
    "#{address.city}, #{address.country}"
  end

  def orders_shipped
    Order.shipped.count
  end
end
