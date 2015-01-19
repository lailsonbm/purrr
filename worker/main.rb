# Client
# irb -r ./main.rb

require 'sidekiq'
require 'sidetiq'

# If your client is single-threaded, we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'purrr', :size => 1 }
end

# Sidekiq server is multi-threaded so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'purrr' }
end

class CreateNewUsers
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
  	minutely.second_of_minute(0, 15, 30, 45)
  end

  def perform
    puts rand(0..1000)
  end
end