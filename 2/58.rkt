#lang racket
(define (square a) (
  (* a a)
))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; (define (make-sum a1 a2) (list '+ a1 a2)) 
; (define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (exponentiation? x)
  (and (pair? x) (eq? (cadr x) '^)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

(define (=number? exp num) 
  (and (number? exp) (= exp num)
))

(define (make-exponentiation b n)
  (cond ((= n 1) b)
         (else (list b '* (make-exponentiation b (- n 1))))
)) 


(define (make-sum a1 a2 var) 
  (cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        ((and (pair? a1) (pair? a2)) (make-sum (deriv a1 var) (deriv a2 var) var))
        ((pair? a1) (make-sum (deriv a1 var) a2 var)) 
        ((pair? a2) (make-sum a1 (deriv a2 var) var))
        (else (list a1  '+ a2))))

(define (make-product m1 m2 var)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
        
        ((=number? m1 1) m2) 
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        ((and (pair? m1) (pair? m2)) (make-product (deriv m1 var) (deriv m2 var) var))
        ((pair? m1) (make-product (deriv m1 var) m2 var)) 
        ((pair? m2) (make-product m1 (deriv m2 var) var))
      
        (else (list  m1 '* m2))))

; (contain? '(a (b c) d) 'd)
; (contain? '(a b  d) 'd)


(define (deriv exp var) 
  (cond ((number? exp) 0) 
        ((variable? exp) (if (same-variable? exp var) 1 0)) 
        ((exponentiation? exp) (list (augend exp) '*  (make-exponentiation  (multiplier exp) (- (augend exp) 1) )))
        ((sum? exp) (make-sum (deriv (addend exp) var) (deriv (augend exp) var) var))
        ((product? exp) (make-sum 
            (make-product (multiplier exp) 
                          (deriv (multiplicand exp) var) var)
            (make-product (deriv (multiplier exp) var) 
                          (multiplicand exp)var) var) var)
        (else (error "unknown expression type -- DERIV" exp))))


(deriv '(x + (x * x)) 'x)
(deriv '(x + (x * (x + 1 ))) 'x)