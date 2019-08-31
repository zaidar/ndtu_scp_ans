#lang racket 

; (define (compose f g)
;     (lambda (x) (f (g x))))

; (define (inc x)(+ x 1))

; ((compose (lambda (x)(* x x)) inc) 6 )

; (define (compose-1 func times)
;     (cond ((not (= times 0))
;               (lambda(x)  ((compose-1 func (- times 1)) (func x))))
;               (else 1)
; ))

; ((compose-1 (lambda (x)(* x x)) 2) 5)


(define (compose f g)
    (lambda (x) (f (g x))))

(define (double f)
    (compose f f))

(define (repeated f n)
    (cond ((= n 1) f)
          ((even? n) (double (repeated f (/ n 2))))
          (else (compose f (repeated f (- n 1))))))

((repeated (lambda (x)(* x x)) 2) 5)