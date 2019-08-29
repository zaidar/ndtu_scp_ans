#lang racket 

(define (some-f n)
  (cond ((< n 3) n)
        (else (+ (some-f (- n 1)) (some-f (- n 2)) (some-f (- n 3))))
))
(some-f 3)