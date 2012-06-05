# siege

** SIEGE 2.71
** Preparing 250 concurrent users for battle.
The server is now under siege...^C
Lifting the server siege...      done.

Transactions:		        3820 hits
Availability:		      100.00 %
Elapsed time:		       96.04 secs
Data transferred:	        0.08 MB
Response time:		        5.59 secs
Transaction rate:	       39.78 trans/sec
Throughput:		        0.00 MB/sec
Concurrency:		      222.37
Successful transactions:        3820
Failed transactions:	           0
Longest transaction:	        6.03
Shortest transaction:	        0.53
 
FILE: /usr/local/var/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.

# Httperf

➜  ~  httperf --hog --server localhost --port 8080 --uri / --num-conns=25 --num-calls=10000  --rate 1
httperf --hog --client=0/1 --server=localhost --port=8080 --uri=/ --rate=1 --send-buffer=4096 --recv-buffer=16384 --num-conns=25 --num-calls=10000
httperf: warning: open file limit > FD_SETSIZE; limiting max. # of open files to FD_SETSIZE
^CMaximum connect burst length: 1

Total: connections 25 requests 27745 replies 27720 test-duration 704.702 s

Connection rate: 0.0 conn/s (28188.1 ms/conn, <=25 concurrent connections)
Connection time [ms]: min 0.0 avg 0.0 max 0.0 median 0.0 stddev 0.0
Connection time [ms]: connect 0.1
Connection length [replies/conn]: 0.000

Request rate: 39.4 req/s (25.4 ms/req)
Request size [B]: 62.0

Reply rate [replies/s]: min 5.0 avg 39.3 max 40.0 stddev 3.8 (140 samples)
Reply time [ms]: response 624.5 transfer 0.0
Reply size [B]: header 209.0 content 23.0 footer 0.0 (total 232.0)
Reply status: 1xx=0 2xx=27720 3xx=0 4xx=0 5xx=0

CPU time [s]: user 27.10 system 676.85 (user 3.8% system 96.0% total 99.9%)
Net I/O: 11.3 KB/s (0.1*10^6 bps)

Errors: total 0 client-timo 0 socket-timo 0 connrefused 0 connreset 0
Errors: fd-unavail 0 addrunavail 0 ftab-full 0 other 0
