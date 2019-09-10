#lang racket

(define (make-point x y) (cons x y))

(define (x-point pt)(car pt))
(define (y-point pt)(cdr pt))

(define (make-segment st-pt end-pt)
  (cons st-pt end-pt))
(define (start-segment seg)(car seg))
(define (end-segment seg)(cdr seg))

(define (midpoint seg)
  (define (start-seg) (car seg))
  (define (end-seg) (cdr seg))
  
  ; (let ((start-seg (start-segmant seg)) (end-seg (end-segmant seg)))
  ;  (make-point
  ;   (/ (- (x-point end-seg) (x-point start-seg)) 2) 
  ;    (/ (- (y-point end-seg) (y-point start-seg)) 2)
  ;  ))
  
  (make-point
    (/ (- (x-point (end-seg)) (x-point (start-seg))) 2) 
    (/ (- (y-point (end-seg)) (y-point (start-seg))) 2)
  ))
; (midpoint (make-segment (make-point 0 0) (make-point 2 4)))