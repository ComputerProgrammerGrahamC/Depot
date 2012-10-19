require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should login" do
    dave = users(:one)
    post :create. :name => dave.name, :password => 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end

  test

end
