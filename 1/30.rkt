#lang racket 

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(remainder 24 16)
; (gcd 16 24)