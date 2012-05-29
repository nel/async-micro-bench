require 'sinatra'

class Sinsync < Sinatra::Base
  set :port, 8080

  get('/') do
    n = 0.5
    sleep n
    "delayed for #{n} seconds"
  end
end

Sinsync.run!
