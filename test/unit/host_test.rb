require 'test_helper'

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "can't save hosts with the same address" do
    a = Host.new(address:"169.231.24.2",inbound:50)
    b = Host.new(address:"169.231.24.2",inbound:0)

    a.save
    assert_raise(ActiveRecord::RecordNotUnique) do
      b.save
    end
  end

end
