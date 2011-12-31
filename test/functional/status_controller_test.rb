require 'test_helper'

class StatusControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "the truth" do
    assert true
  end

  test "should show prompt when visiting from outside resnet" do
    mock_ip("51.41.31.21")
    get :show
  end

  test "should show prompt with flash for unknown ip query" do
    flunk
  end

  test "should show status and prompt when visiting from inside resnet" do
    flunk
  end

  def mock_ip(ip_address)
    ActionDispatch::Request.any_instance.stubs(:remote_ip).returns(ip_address)
  end

end
