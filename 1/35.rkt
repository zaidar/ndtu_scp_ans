#lang racket 

; (define (inc a) (+ a 1)) 
; (define(cube-sum a inc b)
;   (if(= a b) a
;     (+ a (cube-sum (inc a) inc b))
; ))(cube-sum 1 inc 10)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
      
; (* 8 (pi-sum 1 1000))

; (define (cube x)(* x x x))
; (define (integral f a b dx)
;   (define next (lambda() (+ a dx)))
  
;   (define const (lambda()(+ a (/ dx 2))))
  
;   (if (= (/ a dx) b) 
;     0
;     (+ (cube (const) ) (integral f (next) b dx))))
 
;  (integral cube 0 1 0.01)

;1.30

; (define (sum term a next b)
;     (if (> a b)
;         0
        
;         (+ (term a) (sum term (next a) next b))
    
; ))

; (define (sum term a next b)
;     (define (iter a result)
;         (if (> a b)
;             result
;             (iter (next a) (+ result (term a)))))
    
;     (iter a 0))

; (define (integral f a b dx)

;     (define next (lambda(a) (+ a dx)))

;     (define const(lambda()(+ a (/ dx 2.0))))

;     (* (sum f (const) next b) dx))

; (integral (lambda(x)(* x x x)) 0 1 0.01)
