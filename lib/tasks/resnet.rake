require 'net/http'

namespace "resnet" do
  desc "Pull from Stitch"
  task :stitch_pull => :environment do
    Host.update_from_json_config
  end
end
