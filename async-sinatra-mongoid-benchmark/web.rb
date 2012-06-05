require_relative '../lib/mongoid-content'
require 'sinatra/async'

class Sinasync < Sinatra::Base
  set :port, 8080
  set :threaded, false

  register Sinatra::Async

  aget('/') do
    body {  Content.trigger_insert } 
  end
end

Sinasync.run!

