#!/usr/bin/env ruby

require 'open4'
require 'foreman/engine'

BENCH_ROOT = File.expand_path(File.dirname(__FILE__))

class Bench
  def self.each
    Dir.glob('*benchmark').each do |d|
      yield Bench.new(d)
    end
  end

  def initialize(d)
    @name = d
  end

  def engine
    @engine ||= Foreman::Engine.new('Procfile')
  end

  def run!(cmd)
    puts "Starts running #{@name}"
    Dir.chdir BENCH_ROOT
    Dir.chdir @name
    t = Thread.new { engine.start }
    sleep 1
    begin
      pid, stdin, stdout, stderr = Open4::popen4(cmd) 
      return stdout.read
    ensure
      engine.send :terminate_gracefully
      sleep 1
    end
  end
end

Bench.each do |b|
  if ENV['DEBUG'] 
    puts b.run!("curl  http://127.0.0.1:8080/")
  else
    output = b.run!("ulimit -n 2048 && siege -c 25 -b -t 10s http://127.0.0.1:8080/ &>/dev/null && siege -c 25 -b -t2m http://127.0.0.1:8080/ 2>&1")
    puts output
    File.open('Benchmark.md', 'w+') { |f| f.write output }
  end
end

