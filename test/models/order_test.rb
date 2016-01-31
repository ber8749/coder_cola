require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'valid order' do
    assert orders(:davids).valid?
  end

  test 'shipping address' do
    assert_equal addresses(:davids_shipping), orders(:davids).shipping_address
  end

  test 'total quantity' do
    assert_equal orders(:iggys).line_items.sum(:quantity), orders(:iggys).total_quantity
  end
end
