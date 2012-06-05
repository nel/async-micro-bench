# Setup

In each folder you want to test run :

    bundle install
    bundle exec foreman start

Server will be started on port 8080

# Run test suite

Execute ./run-bench, you can use DEBUG=1 to get output quick of the service

# Env

Benchmark got with :

   siege -c 25 -b -t 10s http://127.0.0.1:8080/ &>/dev/null && siege -c 25 -b -t2m http://127.0.0.1:8080/

MacOSX 10.7, ruby 1.9.3 p194, i7 2.8GHz, 16GB ram DDR3, SSD for storage

To avoid classical TIME_WAIT flood:

    sudo sysctl -w net.inet.ip.portrange.first=32768
    sudo sysctl -w net.inet.tcp.msl=1000
    ulimit -n 2048

# Available tests

- single-threaded-sinatra: lock per request, purely synchronous sinatra
- threaded-sinatra: Threaded Sinatra (through EM::Deferrable)
- async-sinatra: Sinatra + Async Sinatra (https://github.com/raggi/async_sinatra)
- goliath: Goliath
