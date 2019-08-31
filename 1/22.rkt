#lang racket 

(define (Ackermanns-func x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
         (else (Acks (- x 1) (Acks x (- y 1))))
)) 
(Ackermanns-func 1 5)