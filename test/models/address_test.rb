require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'valid address' do
    assert addresses(:one).valid?
  end
end
