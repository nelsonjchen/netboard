desc "Pull from Stitch"
task :pull_from_stitch do
    response = Net::HTTP.get_response(URI('http://localhost:8080/report/all'))
    seed = ActiveSupport::JSON.decode()
end
