#lang racket

(define (binary-expression? e) (
  null? (cdddr e)
))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; (define (make-sum a1 a2) (list '+ a1 a2)) 
; (define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '^)))

(define (addend s) (cadr s))

(define (augend s) (if (binary-expression? s) 
    (caddr s)
    (cons '+  (cddr s))
))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (if (binary-expression? p) 
    (caddr p)
    (cons '*  (cddr p))
))


(define (=number? exp num) 
  (and (number? exp) (= exp num)
))

(define (make-exponentiation b n)
  (cond ((= n 1) b)
         (else (list '* b (make-exponentiation b (- n 1))))
)) 


(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
        ((=number? m1 1) m2) 
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        (else (list '* m1 m2))))

(define (contain? aterm term)
  (cond ((eq? aterm term) #t)
        ((pair? aterm)
          (or (contain? (cdr aterm) term ) (contain? (car aterm) term)))
        (else #f)
))
; (contain? '(a (b c) d) 'd)
; (contain? '(a b  d) 'd)


(define (deriv exp var) 
  (cond ((number? exp) 0) 
        ((variable? exp) (if (same-variable? exp var) 1 0)) 
        ((exponentiation? exp) (list '* (augend exp) (make-exponentiation  (multiplier exp) (- (augend exp) 1) )))
        ((sum? exp) (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
        ((product? exp) (make-sum 
            (make-product (multiplier exp) 
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var) 
                          (multiplicand exp))))
        (else (error "unknown expression type -- DERIV" exp))))

; (deriv '(* (^ x 3) (^ x 3))  0)
; (deriv '(^ n 5) '2)
; (deriv '(* x (* x 4)) 'x)
(deriv '(* (^ x 2) y z) 'x)
(deriv '(* x y (+ x 3)) 'x)
; (cddr '(a b c d))
; (cadddr '(a b c d))
; (list '* '1 4)

; (null? (cdddr '(+ a b c)))