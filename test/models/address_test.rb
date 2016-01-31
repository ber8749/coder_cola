require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'valid address' do
    assert addresses(:davids_shipping).valid?
  end
end
