require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test 'valid line item' do
    assert line_items(:one).valid?
  end
end
