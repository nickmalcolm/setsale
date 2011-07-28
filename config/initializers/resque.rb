require 'resque'
Resque.redis.namespace = "resque:setsale"
require 'resque/server'
Resque::Server.use Rack::Auth::Basic do |username, password|
  username == "resqueview"
  password == "1 just spent 6 months in a leaky boat"
end