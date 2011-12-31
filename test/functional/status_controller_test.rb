require 'test_helper'

class StatusControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "the truth" do
    assert true
  end

  test "should show outside prompt when visiting from outside resnet" do
    mock_ip("51.41.31.21")
    get :show
    assert_response :success
    assert_template "outside"
  end

  test "should show unknown layout for unknown query from outside resnet" do
    mock_ip("51.41.31.21")
    get :show, {address:"51.41.31.21"}
    assert_response :success
    assert_template "unknown"
  end

  test "should show status layout when visiting from inside known resnet" do
    mock_ip("169.231.39.189")
    get :show
    assert_response :success
    assert_template "show"
  end

  test "should show status layout when known query from inside known resnet" do
    mock_ip("169.231.39.189")
    get :show, {address:"169.231.12.129"}
    assert_response :success
    assert_template "show"
  end

  test "should show unknown layout for unknown query from inside resnet" do
    mock_ip("169.231.39.189")
    get :show, {address:"51.41.31.21"}
    assert_response :success
    assert_template "unknown"
  end

  def mock_ip(ip_address)
    @request.env['REMOTE_ADDR'] = ip_address    
  end
end
