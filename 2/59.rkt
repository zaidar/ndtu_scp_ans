#lang racket
(define (element-of-set? x set) 
  (cond ((null? set) false) 
    ((equal? x (car set)) true) 
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) 
  (if (element-of-set? x set) set(cons x set)))

(define (intersection-set set1 set2) 
  (cond ((or (null? set1) (null? set2)) '()) 
      ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2))) 
      (else (intersection-set (cdr set1) set2))))


(define (union-set set-1 set-2)
    (cond ((null? set-1) set-2)
          ((null? set-2) set-1)
          ((element-of-set? (car set-1) set-2) (union-set (cdr set-1) set-2))
          (else (cons (car set-1) (union-set (cdr set-1) set-2)))
         
  ; (list (union a1 a2) a1)
))


(union-set '(a b c d) '(a b c))