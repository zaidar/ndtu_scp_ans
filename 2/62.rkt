#lang racket

(define (element-of-set? x set) 
  (cond ((null? set) false) 
        ((equal? x (car set)) true) 
        (else (element-of-set? x (cdr set)))))

(define (union-set set-1 set-2 ) (
  cond ((null? set-1)  set-2 )
       ((null? set-2)  set-1 )
       ((= (car set-1) (car set-2)) (union-set (cdr set-1) set-2)) 
       ((< (car set-1) (car set-2)) (cons (car set-1) (union-set (cdr set-1)  set-2)))
       ((> (car set-1) (car set-2)) (cons (car set-2) (union-set set-1 (cdr set-2))))
      
))

(define set-1 '(-1 -1 1 2 3 6 15) )
(define set-2 '(0 0 1 4 5 9 11 12 16 18 19) )
(union-set set-1 set-2)
;'(-1 -1 0 0 1 2 3 4 5 6 9 11 12 15)