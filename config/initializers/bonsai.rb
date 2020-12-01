# if Rails.env == 'production'
#   # url = ENV["BONSAI_URL"]
#   # transport_options = { request: { timeout: 250 } }
#   # options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
#   # Searchkick.client = Elasticsearch::Client.new(options)
#   Searchkick.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
  
# end

if ENV['BONSAI_URL']
  Searchkick.client = Elasticsearch::Client.new({url: ENV['BONSAI_URL'], logs: true})
end