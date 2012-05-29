#!/usr/bin/env ruby

require 'goliath'

class Goliasync < Goliath::API

  def response(env)
    n = 0.5
    EM::Synchrony.sleep(n)
    [200, {}, "delayed for #{n} seconds"]
  end
end
