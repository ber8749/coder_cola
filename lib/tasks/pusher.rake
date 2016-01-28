namespace :pusher do
  require 'pusher_wrapper'
  namespace :order do
    desc 'create example orders via pusher every 5 seconds'
    task push_examples: :environment do
      coder_cola = Product.find_by_name('Coder Cola Case')
      PusherWrapper.push_order_examples(coder_cola.sold, coder_cola.shipped)
    end
  end
end
