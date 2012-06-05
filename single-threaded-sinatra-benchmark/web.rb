require 'sinatra'

set :threaded, false

get('/') do
  n = 0.5
  sleep n
  "delayed for #{n} seconds"
end
