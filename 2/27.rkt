#lang racket

; (define (last-pair items)
;   (if (empty? (cdr items))
;     items
;     (last-pair (cdr items))
; )) ;(last-pair (list 23 72 149 34 54))




;(define (reverse items)
  ;   (define reverse-iter (lambda (items prod)
  ;      (if (empty? items)
  ;            prod
  ;            (reverse-iter (cdr items) (cons (car items) prod)))
  ;      ))
  ;  
  ; (reverse-iter items '()))
  
  
;   (define (reverse-iter items list)
;       (if (empty? items)
;         list
;         (reverse-iter (cdr items) (cons (car items) list))
;   ))
;   (reverse-iter items '()))

; (reverse (list 23 72 149 34 54))