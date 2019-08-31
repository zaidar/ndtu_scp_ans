#lang racket
; (define (iter-tring-col)
  ; (
; ))
(define (pask-tring n k) 
  (cond ((= n 0) k)
        (else (~a k '" "(pask-tring (- n 1) (+ k k)) '" " k ))
))
(pask-tring 5 1)