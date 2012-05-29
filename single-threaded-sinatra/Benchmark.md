#siege

➜  ~  siege -c 250 http://127.0.0.1:8080/
** SIEGE 2.71
** Preparing 250 concurrent users for battle.
The server is now under siege...^C
Lifting the server siege...      done.

Transactions:		          23 hits
Availability:		      100.00 %
Elapsed time:		       12.10 secs
Data transferred:	        0.00 MB
Response time:		        6.07 secs
Transaction rate:	        1.90 trans/sec
Throughput:		        0.00 MB/sec
Concurrency:		       11.54
Successful transactions:          23
Failed transactions:	           0
Longest transaction:	       11.57
Shortest transaction:	        0.00
 
FILE: /usr/local/var/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.

# httperf

➜  ~  httperf --hog --server localhost --port 8080 --uri / --num-conns=25 --num-calls=10000  --rate 1
httperf --hog --client=0/1 --server=localhost --port=8080 --uri=/ --rate=1 --send-buffer=4096 --recv-buffer=16384 --num-conns=25 --num-calls=10000
httperf: warning: open file limit > FD_SETSIZE; limiting max. # of open files to FD_SETSIZE
^CMaximum connect burst length: 1

Total: connections 25 requests 379 replies 354 test-duration 179.205 s

Connection rate: 0.1 conn/s (7168.2 ms/conn, <=25 concurrent connections)
Connection time [ms]: min 66519.4 avg 106103.4 max 159758.2 median 92561.5 stddev 39282.7
Connection time [ms]: connect 0.1
Connection length [replies/conn]: 88.500

Request rate: 2.1 req/s (472.8 ms/req)
Request size [B]: 62.0

Reply rate [replies/s]: min 1.8 avg 2.0 max 2.2 stddev 0.1 (35 samples)
Reply time [ms]: response 10287.8 transfer 0.0
Reply size [B]: header 209.0 content 23.0 footer 0.0 (total 232.0)
Reply status: 1xx=0 2xx=354 3xx=0 4xx=0 5xx=0

CPU time [s]: user 7.81 system 168.88 (user 4.4% system 94.2% total 98.6%)
Net I/O: 0.6 KB/s (0.0*10^6 bps)

Errors: total 4 client-timo 0 socket-timo 0 connrefused 0 connreset 4
Errors: fd-unavail 0 addrunavail 0 ftab-full 0 other 0
