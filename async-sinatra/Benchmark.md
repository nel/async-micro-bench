# Siege

➜  ~  siege -c 250 http://127.0.0.1:8080/
** SIEGE 2.71
** Preparing 250 concurrent users for battle.
The server is now under siege...^C
Lifting the server siege...      done.

Transactions:		       23181 hits
Availability:		      100.00 %
Elapsed time:		       93.72 secs
Data transferred:	        0.51 MB
Response time:		        0.55 secs
Transaction rate:	      247.34 trans/sec
Throughput:		        0.01 MB/sec
Concurrency:		      136.40
Successful transactions:       23181
Failed transactions:	           0
Longest transaction:	        0.63
Shortest transaction:	        0.50

# Httperf

➜  ~  httperf --hog --server localhost --port 8080 --uri / --num-conns=25 --num-calls=10000  --rate 1
httperf --hog --client=0/1 --server=localhost --port=8080 --uri=/ --rate=1 --send-buffer=4096 --recv-buffer=16384 --num-conns=25 --num-calls=10000
httperf: warning: open file limit > FD_SETSIZE; limiting max. # of open files to FD_SETSIZE
^CMaximum connect burst length: 1

Total: connections 25 requests 21256 replies 21231 test-duration 487.105 s

Connection rate: 0.1 conn/s (19484.2 ms/conn, <=25 concurrent connections)
Connection time [ms]: min 0.0 avg 0.0 max 0.0 median 0.0 stddev 0.0
Connection time [ms]: connect 0.1
Connection length [replies/conn]: 0.000

Request rate: 43.6 req/s (22.9 ms/req)
Request size [B]: 62.0

Reply rate [replies/s]: min 5.0 avg 43.6 max 45.0 stddev 5.6 (97 samples)
Reply time [ms]: response 559.1 transfer 0.0
Reply size [B]: header 147.0 content 23.0 footer 0.0 (total 170.0)
Reply status: 1xx=0 2xx=21231 3xx=0 4xx=0 5xx=0

CPU time [s]: user 19.07 system 467.74 (user 3.9% system 96.0% total 99.9%)
Net I/O: 9.9 KB/s (0.1*10^6 bps)

Errors: total 0 client-timo 0 socket-timo 0 connrefused 0 connreset 0
Errors: fd-unavail 0 addrunavail 0 ftab-full 0 other 0
