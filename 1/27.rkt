#lang racket

(define (double a)(+ a a))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (+ (double a) (* a (- b 2))))
         (else (+ a (* a (- b 1))))
))
(* 5 5)