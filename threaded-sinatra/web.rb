require 'sinatra'

get('/') do
  n = 0.5
  sleep n
  "delayed for #{n} seconds"
end
