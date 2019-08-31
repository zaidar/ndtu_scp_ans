#lang racket
; (require racket/include)
; (include "sicp1.2.6.rkt")
(define (square x)(* x x))
;;https://en.wikipedia.org/wiki/Fermat_primality_test
;; a < n  
  ;; try - it => a = 1 < n
  ;; a ^ n 
  ;;
  
(define (expmod base exp m)
  (cond
   ((= exp 0) 1)
   ((even? exp)
    (remainder (square (expmod base (/ exp 2) m)) m))
    (else
    (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test a n)
  (define(try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
)

 (fermat-test 2 7)

 ;;;;
;;;;  1.27
 ;;;;