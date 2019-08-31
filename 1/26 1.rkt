#lang racket 

(define (prime? n)
  (define (try x)
    (if (> (* x x) n)
        n
        (if (= (remainder n x) 0)
            x
            (try (+ x 1)))))
  (= (try 2) n))

(define runtime
  (current-milliseconds))


(define (timed-prime-test n) 
  (start-prime-test n runtime))
(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (current-milliseconds) start-time)) 
      false))
(define (report-prime n elapsed-time) 
  (display n) 
  (display " *** ") 
  (display elapsed-time) 
  (newline) 
  true)
(define (search-for-primes number-from prime-count) 
  (if (> prime-count 0) 
      (if (timed-prime-test number-from)
          (search-for-primes (+ number-from 1) (- prime-count 1)) 
          (search-for-primes (+ number-from 1) prime-count))
          0))

(time(search-for-primes 100000000000 3))
(time(search-for-primes 1000000000000 3) )
(time(search-for-primes 10000000000000 3) )
(time(search-for-primes 100000000000000 3)) 
