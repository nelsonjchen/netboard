require 'resolv'

class Host < ActiveRecord::Base
  validates :ip_address, presence:true, uniqueness:true

  def find_by_address(address)
    self.find_by_ip_address(Resolv.getaddress(address))
  end

  def find_by_address!(address)
    self.find_by_ip_address!(Resolv.getaddress(address))
  end
end
