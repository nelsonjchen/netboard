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
    assert_equal "51.41.31.21", assigns[:address]
  end

  test "should show prompt layout with flash for unknown ip query" do
    flunk
  end

  test "should show status and prompt layout when visiting from inside resnet" do
    mock_ip("169.231.39.189")
    get :show
    assert_response :success
    flunk
  end

  def mock_ip(ip_address)
    @request.env['REMOTE_ADDR'] = ip_address    
  end

end
