#lang racket
(require racket/include)
(include "defines.rkt")

; (define (deriv exp var) 
;   (cond ((number? exp) 0)
;         (() )~
;         (( number? exp ) #t )
;         ; (( )  )
;         (else #f)
; ))

(define (deriv exp var) 
  (cond ((number? exp) 0) 
        ((variable? exp) (if (same-variable? exp var) 1 0)) 
        ((exponentiation? exp) (list '* (caddr exp) (make-exponentiation  (cadr exp) (- (caddr exp) 1) )))
        ((sum? exp) (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
        ((product? exp) (make-sum 
            (make-product (multiplier exp) 
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var) 
                          (multiplicand exp))))
        (else (error "unknown expression type -- DERIV" exp))))

(deriv '(* (^ x 3) (^ x 3))  0)
; (deriv '(^ n 5) '2)
; (deriv '(* (* x x) y) 'x)
; (deriv '(* x y (+ x 3)) 'x)
; (cddr '(a b c d))