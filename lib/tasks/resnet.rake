namespace "resnet" do
  desc "Pull from Stitch"
  task :stitch_pull => :environment do
    CONFIG = YAML.load_file(Rails.root.join("config/resnet.yml"))
  end
end
