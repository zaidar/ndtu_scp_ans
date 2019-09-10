#lang racket 

; (define x-1 (cons 1 (cons 2 (cons 3 (cons 4 5)) )))
; (define x-2 (cons 6 (cons 7 (cons 8(cons 9 10)) )))


; (define (list-ref items n)
;     (if (= n 0)
;         (if (pair? items) (car items) items)
;       (list-ref (cdr items) (- n 1))
; )); (list-ref x-1 3)

; (define (length items n)
;   (if(pair? items)
;     (+ n 1 (length (cdr items) n))
;     1
; )); (length x-1 0)

; (define (append list-1 list-2)
;   (if(pair? list-1)
;     (cons (car list-1) (append (cdr list-1) list-2)) 
;     (cons list-1 list-2)
; )); (append x-1 x-2)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define (g) (gcd n d))
  
  (define (pair n d)
      (if (and (< d 0) (> n 0)) 
        (cons (- n) d)
        (cons n d)))

(;let ((g (gcd n d) ))
    ; (pair (/ n g) (/ d g))
    pair (/ n (g)) (/ d (g))
  ))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define x (make-rat 9 12))
(define (print-rat x)(~a (numer x)" / "(denom x)))

(print-rat x)




