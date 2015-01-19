require 'bundler/setup'
require 'lotus/router'
require 'json'
require 'purrr'

app = Lotus::Router.new do
  get '/', to: ->(env) {
  	[200, {'Content-Type' => 'application/json'}, [JSON.dump(Purrr::User.all.map(&:attributes))]]
  }
end

Rack::Server.start app: app, Port: ENV['PORT']
