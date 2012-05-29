require 'sinatra/async'

class Sinasync < Sinatra::Base
  register Sinatra::Async
  set :port, 8080

  aget('/') do
    n = 0.5
    EM.add_timer(n) { body { "delayed for #{n} seconds" } }
  end
end

Sinasync.run!
