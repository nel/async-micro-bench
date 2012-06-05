require 'mongoid'

Mongoid.configure do |config|
  config.connect_to("async-bench-mongoid")
end

Mongoid.purge!

class Content
  include Mongoid::Document
  field :title, type: String

  def self.trigger_insert
    create! title: "test"
    "inserted"
  end
end
