require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "hosts without information do not save" do
    h = Host.new
    assert_equal false, h.save
  end

  test "hosts without addresses do not save" do
    h = Host.new(address:nil,
                 inbound:1810829950,
                 outbound:192244170,
                 restricted:{out:false, in:false})
    assert_equal false, h.save
  end

  test "hosts without any info do not save" do
    h = Host.new
    assert_equal false, h.save
  end

  test "hosts with proper info do save" do
    h = get_valid_host
    assert_equal true, h.save
  end

  def get_valid_host
    return Host.new(address:"169.231.39.189",
                inbound:12,
                outbound:15,
                restricted:{out:false, in:false})
  end
end
