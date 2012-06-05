require 'sinatra/async'

class Sinasync < Sinatra::Base
  set :port, 8080
  set :threaded, false
  
  register Sinatra::Async

  aget('/') do
    n = 0.5
    EM.add_timer(n) { body { "delayed for #{n} seconds" } }
  end
end

Sinasync.run!
