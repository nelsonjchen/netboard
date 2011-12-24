require 'resolv'

class Host < ActiveRecord::Base
  validates :ip_address, presence:true, uniqueness:true

  # The following should be as if we looked up by address in the first place.
  public
  def self.find_by_address(address)
    self.find_by_ip_address(Resolv.getaddress(address))
  end

  def self.find_by_address!(address)
    self.find_by_ip_address!(Resolv.getaddress(address))
  end
end
