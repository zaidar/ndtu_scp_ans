#lang racket

(define (subset s)
    (if (null? s)
        (list '())
        (let ((rest (subset (cdr s))))
        (append 
          rest 
          (map 
            (lambda (ls) (cons (car s) ls))
            rest))
)))

(subset '(1 2 3))

; (define (func) (lambda (ls)
;   (* 2 ls)
; ))
; (map (func) '(5 4))