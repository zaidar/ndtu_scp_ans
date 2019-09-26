#lang racket

(define (adjoin-set set-1 set-2) 
    (cond 
      ((not (pair? set-1)) set-2) 
      ((not (pair? set-2)) set-1)
      (else 
        (let ((h1 (car set-1)) (h2 (car set-2)) ) (
          cond ((= h1 h2) (adjoin-set (cdr set-1) set-2)) 
               ((< h1 h2) (cons h1 (adjoin-set (cdr set-1)  set-2)))
               ((> h1 h2) (cons h2 (adjoin-set set-1 (cdr set-2))))
      )))
))

(define set-1 '(1 2 3 3 3 3 6 12) )
(define set-2 '(1 3 3 5 9 11 12 12) )
(adjoin-set set-1 set-2)
; '(1 2 3 3 5 6 9 11 12)