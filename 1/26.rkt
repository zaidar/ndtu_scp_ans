#lang racket
(define (square n) (* n n n))
(define (next n)
  (if(= n 2) 
    3
    (+ n 2)
))
(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
      (define (divides? a b) (= (remainder b a) 0))
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
             (else (find-divisor n (next test-divisor)))))
  
  (find-divisor n 2))

 (smallest-divisor 199)
 (smallest-divisor 1999)
 (smallest-divisor 19999)