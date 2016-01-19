require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'valid product' do
    assert products(:one).valid?
  end

  test 'shipped' do
    assert_equal 1, products(:one).shipped
  end

  test 'sold' do
    assert_equal products(:one).line_items.sum(:quantity), products(:one).sold
  end
end
