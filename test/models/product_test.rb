require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'valid product' do
    assert products(:coder_cola).valid?
  end

  test 'shipped' do
    assert_equal 7, products(:coder_cola).shipped
  end

  test 'sold' do
    assert_equal products(:coder_cola).line_items.sum(:quantity), products(:coder_cola).sold
  end
end
