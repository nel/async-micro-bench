# siege

➜  ~  siege -c 250 http://127.0.0.1:8080/
** SIEGE 2.71
** Preparing 250 concurrent users for battle.
The server is now under siege...^C
Lifting the server siege...      done.

Transactions:		       33078 hits
Availability:		      100.00 %
Elapsed time:		      119.14 secs
Data transferred:	        0.73 MB
Response time:		        0.51 secs
Transaction rate:	      277.64 trans/sec
Throughput:		        0.01 MB/sec
Concurrency:		      142.00
Successful transactions:       33078
Failed transactions:	           0
Longest transaction:	        1.86
Shortest transaction:	        0.50

# httperf

➜  ~   httperf --hog --server localhost --port 8080 --uri / --num-conns=25 --num-calls=10000  --rate 1
httperf --hog --client=0/1 --server=localhost --port=8080 --uri=/ --rate=1 --send-buffer=4096 --recv-buffer=16384 --num-conns=25 --num-calls=10000
httperf: warning: open file limit > FD_SETSIZE; limiting max. # of open files to FD_SETSIZE
^CMaximum connect burst length: 1

Total: connections 25 requests 21475 replies 21450 test-duration 444.769 s

Connection rate: 0.1 conn/s (17790.8 ms/conn, <=25 concurrent connections)
Connection time [ms]: min 0.0 avg 0.0 max 0.0 median 0.0 stddev 0.0
Connection time [ms]: connect 0.1
Connection length [replies/conn]: 0.000

Request rate: 48.3 req/s (20.7 ms/req)
Request size [B]: 62.0

Reply rate [replies/s]: min 5.0 avg 48.2 max 50.0 stddev 6.7 (88 samples)
Reply time [ms]: response 504.0 transfer 0.0
Reply size [B]: header 93.0 content 23.0 footer 0.0 (total 116.0)
Reply status: 1xx=0 2xx=21450 3xx=0 4xx=0 5xx=0

CPU time [s]: user 17.61 system 426.90 (user 4.0% system 96.0% total 99.9%)
Net I/O: 8.4 KB/s (0.1*10^6 bps)

Errors: total 0 client-timo 0 socket-timo 0 connrefused 0 connreset 0
Errors: fd-unavail 0 addrunavail 0 ftab-full 0 other 0
