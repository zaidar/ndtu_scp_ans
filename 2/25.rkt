#lang racket

; (define (cons x y z)
;   (lambda (m) (m x y z)))

; (define (car z)
;   (z (lambda (p q z) z)))

;   (car (cons 2 4 5))


; (define (cons a b)
;   (cond ((> a 0)(* 2 (cons (- a 1) b)))
;         ((> b 0)(* 3 (cons a (- b 1))))
;          (else 1) 
; ))
; (cons 0 2)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))
    
; ((add-1 zero) 2)
; ((((add-1 zero)  zero) 0) 0)
; (add-1 zero)
; (add-1 (lambda (f) (lambda (x) x)))
(define one
  (lambda (f)
    (lambda (x)
      (f x))))
      
     ((one sqrt) 4)