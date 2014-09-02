require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get portafolio" do
    get :portafolio
    assert_response :success
  end

end
