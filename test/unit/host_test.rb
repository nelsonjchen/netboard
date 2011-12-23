require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "hosts without information do not save" do
    h = Host.new
    assert_equal false, h.save
  end

end
