require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  # Test uniqueness
  test "can't save hosts with the same address" do
    a = Host.new(ip_address:"169.231.24.2",inbound:50)
    b = Host.new(ip_address:"169.231.24.2",inbound:0)
    a.save
    assert_equal false, b.save
  end

  test "capped cable modem user is capped" do
    a = Host.find_by_address("169.231.32.4")
    assert_equal true, a.inbound_restricted
  end

  test "update an existing host with new data" do
    b = Host.find_or_create_by_ip_address("169.231.33.2")
    b.update_attributes({
      inbound: 9999999999,
      outbound: 0,
      inbound_restricted:true,
      outbound_restricted:false})
    c = Host.find_or_create_by_ip_address("169.231.33.2")
    assert_equal 0, c.outbound
    assert_equal 9999999999, c.inbound
    assert_equal true, c.inbound_restricted
  end

  test "looking up nonexistant host" do
    assert_raise(ActiveRecord::RecordNotFound) do
      Host.find_by_address!("127.0.0.1")
    end
  end

end
