#lang racket

(define (fact-iter current count n)
    (if (= count n) current
    (* current (fact-iter (+ current 1) (+ count 1) n))
))

(define factorial 
  (lambda(n) (fact-iter 1 1 n) 
))

(factorial 6)