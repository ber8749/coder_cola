module PusherWrapper
  def self.push_order_examples(current_sold, current_shipped)
    (1..5).each do |i|
      running_total = (i * (i + 1)) / 2
      sold = current_sold + running_total
      shipped = current_shipped + running_total
      attrs = { first_name: "User#{i}", city: "City#{i}", country: "Country#{i}", quantity: i, sold: sold, shipped: shipped }
      PusherWrapper.push(channel, 'order_created', attrs)
      sleep(5)
    end
  end

  def self.push(channel, event, attributes = {})
    Pusher.trigger(channel, event, attributes)
  end

  def self.channel
    "coder_cola_#{Rails.env}"
  end
end
