#lang racket

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (cond ((null? rest) result)
          ((pair? rest) (op (iter initial (cdr rest)) (car rest)) )
          (else '() ) ))
  (iter initial sequence))


(define (reverse sequence)
  (fold-right (lambda (x y) (cons x y )) '() sequence))
; (define (reverse sequence)
  ; (fold-left (lambda (x y) (cons x y )) '() sequence))

(reverse (list 1 2 3 4)) 
; '((((() . 4) . 3) . 2) . 1)
;'((((() . 1) . 2) . 3) . 4)