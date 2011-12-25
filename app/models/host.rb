require 'resolv'
require 'net/http'

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

  def self.update_from_json(config_filepath = nil)
    config_filepath = config_filepath || Rails.root.join("config/resnet.yml")
    url = YAML.load_file(config_filepath)['stitch_url']
    resp = Net::HTTP.get(URI(url))
    hosts = ActiveSupport::JSON.decode(resp)
    self.transaction do
      hosts.each do |host|
        mHost = self.find_or_create_by_ip_address(host[0])
        attributes = host[1]

        mHost.inbound = attributes["inbound"]
        mHost.outbound = attributes["outbound"]
        mHost.inbound_restricted = attributes["in_restricted"]
        mHost.outbound_restricted = attributes["out_restricted"]
        mHost.save!
      end
    end
  end
end
