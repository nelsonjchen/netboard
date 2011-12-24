require 'net/http'

namespace "resnet" do
  desc "Pull from Stitch"
  task :stitch_pull => :environment do
    CONFIG = YAML.load_file(Rails.root.join("config/resnet.yml"))
    url = CONFIG['stitch_url']
    res = Net::HTTP.get(URI(url))
    hosts = ActiveSupport::JSON.decode(res)
    Host.transaction do
      hosts.each do |host|
        mHost = Host.find_or_create_by_ip_address(host[0])
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
