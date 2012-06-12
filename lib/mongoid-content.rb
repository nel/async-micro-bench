require 'mongoid'

Mongoid.configure do |config|
  config.connect_to("async-bench-mongoid")
end

Mongoid.purge!

class Content
  TEST_STRING = "test " * 400


  include Mongoid::Document
  field :title, type: String

  def self.trigger_insert
    create! title: TEST_STRING
    "inserted"
  end

  def self.trigger_read
    Content.where(:title => TEST_STRING).limit(100)
    "read 100"
  end

  def self.trigger_sleep
    Content.mongo_session.command('eval' => "sleep(500)")
    'sleep 0.5s'
  end

  def self_read_write_bench
    trigger_read
    trigger_insert
    "r/w read 100 and insert"
  end
end
