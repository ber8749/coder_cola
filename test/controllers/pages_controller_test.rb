require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = User.new
    @user.addresses.new
  end

  test "should get home" do
    get :home
    assert_response :success
  end
end
