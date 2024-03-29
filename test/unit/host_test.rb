require 'test_helper'
require 'resolv'

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "can't save hosts with the same address" do
    a = Host.new(ip_address:"169.231.24.2",inbound:50)
    b = Host.new(ip_address:"169.231.24.2",inbound:0)
    a.save
    assert_equal false, b.save
  end

  test "capped cable modem user is capped" do
    a = Host.find_by_address(hosts(:capped_cable_modem_user).ip_address)
    assert_equal true, a.inbound_restricted
  end

  test "uncapped cable modem user is uncapped" do
    a = Host.find_by_address(hosts(:uncapped_cable_modem_user).ip_address)
    assert_equal false, a.inbound_restricted
  end

  # Pretend update script thing
  test "update an existing host with new data" do
    updating_user_address = hosts(:user_that_needs_updating).ip_address
    b = Host.find_or_create_by_ip_address(updating_user_address)
    b.update_attributes({
      inbound: 9999999999,
      outbound: 0,
      inbound_restricted:true,
      outbound_restricted:false})
    c = Host.find_or_create_by_ip_address(updating_user_address)
    assert_equal 0, c.outbound
    assert_equal 9999999999, c.inbound
    assert_equal true, c.inbound_restricted
  end

  test "looking up nonexistant ip address" do
    assert_raise(ActiveRecord::RecordNotFound) do
      Host.find_by_address!("127.0.0.1")
    end
  end

  test "looking up a user who puts in a DNS name" do
    user_ip_address = hosts(:topsite).ip_address
    Resolv.expects(:getaddress).with("example.com").returns(user_ip_address)
    h = Host.find_by_address("example.com")
    assert_equal user_ip_address, h.ip_address
  end

  test "looking up for a user who puts in a DNS name that doesn't exist" do
    Resolv.expects(:getaddress).with("example.com").returns("127.0.0.1")
    assert_equal nil, Host.find_by_address("example.com")
  end

  test "parse a json from external sources" do
    res = get_example_json
    Host.update_from_json(res)

    host = Host.find_by_address("169.231.45.54")

    assert_equal 13, host.inbound
    assert_equal false, host.outbound_restricted

    host2 = Host.find_by_address("169.231.54.12")

    assert_equal 1802313121, host2.inbound
    assert_equal true, host2.inbound_restricted
  end

  def get_example_json
    res = nil
    File.open(Rails.root.join("test/fixtures/stitch_example.json")) do |f|
      res = f.read
    end
    res
  end

  test "only accept IPv4 addresses for Host model" do
    a = Host.find_or_create_by_ip_address("invalid ip")
    assert_equal false, a.save
    b = Host.find_or_create_by_ip_address("169.231.2.1")
    assert_equal true, b.save
  end

  test "finding unresolvable address returns nil" do
    assert_equal nil, Host.find_by_ip_address("nil")
  end
end
