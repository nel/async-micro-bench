require_relative '../lib/mongoid-content'
require 'sinatra'

get('/') do
  Content.trigger_sleep
end
