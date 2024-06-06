targets = count_primes \
          count_primes_gettime \
		  count_primes_gettimeofday \
		  count_primes_rdtsc \
		  count_primes_parallel

all: $(targets)

count_primes: count_primes.c
	gcc -o count_primes count_primes.c

count_primes_gettime: count_primes_gettime.c
	gcc -o count_primes_gettime count_primes_gettime.c

count_primes_gettimeofday: count_primes_gettimeofday.c
	gcc -o count_primes_gettimeofday count_primes_gettimeofday.c

count_primes_rdtsc: count_primes_rdtsc.c
	gcc -o count_primes_rdtsc count_primes_rdtsc.c

count_primes_parallel: count_primes_parallel.c
	mpicc -o count_primes_parallel count_primes_parallel.c

.PHONY: clean
clean:
	-rm -f $(targets)
