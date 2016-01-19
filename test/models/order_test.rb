require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'valid order' do
    assert orders(:one).valid?
  end

  test 'shipping address' do
    assert_equal addresses(:one), orders(:one).shipping_address
  end

  test 'total quantity' do
    assert_equal orders(:one).line_items.sum(:quantity), orders(:one).total_quantity
  end
end
