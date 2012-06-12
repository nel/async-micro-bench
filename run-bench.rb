#!/usr/bin/env ruby

require 'foreman/engine/cli'

BENCH_ROOT = File.expand_path(File.dirname(__FILE__))

class Bench
  class Engine < Foreman::Engine::CLI
    NAMESPAME = 'Benchmark'
    
    attr_reader :benchmark_output

    def output(name, data)
      super
      (@benchmark_output ||= '') << data if name.start_with?(NAMESPAME)
    end

    def setup_bench(cmd, options = {})
      register NAMESPAME, cmd, options
    end
  end

  def self.each
    benchmarks = (ENV['BENCH'] && ENV['BENCH'].split(',')) || Dir.glob('*benchmark')
    benchmarks.shuffle.each do |d|
      yield Bench.new(d)
    end
  end

  def initialize(d)
    @name = d
  end

  def engine
    @engine ||=  Engine.new :root => self.pwd
  end

  def self.exec!(cmd)
    Kernel.system cmd
  end

  def self.run_system_optimization!
    exec! system_optimization
  end

  #MacOS specific
  def self.system_optimization
    "sudo sysctl -w net.inet.ip.portrange.first=32768 && sudo sysctl -w net.inet.tcp.msl=1000"
  end

  #MacOS specific
  def process_optimization
    "ulimit -n 2048"
  end

  def pwd
    File.join(BENCH_ROOT, @name)
  end

  def run!(cmd)
    puts "Starts running #{@name}"
   
    engine.load_procfile File.join self.pwd, 'Procfile'
    engine.setup_bench "#{process_optimization} && #{cmd}", :cwd => self.pwd
    engine.start
    engine.benchmark_output
  end
end

Bench.run_system_optimization!

Bench.each do |b|
  if ENV['DEBUG'] 
    puts b.run!("curl  http://127.0.0.1:8080/")
  else
    output = b.run!("siege -c 25 -b -t 10s http://127.0.0.1:8080/ &>/dev/null && siege -c 25 -b -t100s http://127.0.0.1:8080/ 2>&1")
    File.open(File.join(b.pwd, 'Benchmark.md'), 'w+') { |f| f.write output }
  end
end
