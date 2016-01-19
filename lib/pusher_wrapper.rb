module PusherWrapper
  def self.push_order_examples(current_sold, current_shipped)
    (1..5).each do |i|
      sleep(5)
      running_total = (i * (i + 1)) / 2
      PusherWrapper.push('coder_cola', 'order_created',{
          first_name: "User#{i}",
          city: "City#{i}",
          country: "Country#{i}",
          quantity: i,
          sold: current_sold + running_total,
          shipped: current_shipped + running_total
      })
    end
  end

  def self.push(channel, event, attributes = {})
    Pusher.trigger(channel, event, attributes)
  end
end