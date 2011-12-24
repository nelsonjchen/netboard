desc "Pull from Stitch"
task :pull_from_stitch, :url => :enviroment do |t, args|
    puts args[:url]
    response = Net::HTTP.get_response(URI(args[:url]))
    seed = ActiveSupport::JSON.decode(response)
end
