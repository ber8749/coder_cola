require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    assert users(:valid).valid?, true
  end

  test 'full name' do
    assert_equal 'John Doe', User.new(first_name: 'John', last_name: 'Doe').full_name
  end

  test 'is admin?' do
    assert users(:admin).is_admin?, true
  end

  test 'shipping address' do
    assert_equal addresses(:one), users(:one).shipping_address
  end
end
