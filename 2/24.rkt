#lang racket

(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point pt)(car pt))
(define (y-point pt)(cdr pt))

(define (make-segment st-pt end-pt)
  (cons st-pt end-pt))
(define (start-segment seg)(car seg))
(define (end-segment seg)(cdr seg))


(define (length-segment seg)
  (sqrt
    (+
      (square (- (x-point (start-segment seg)) 
                 (x-point (end-segment seg))))
      (square (- (y-point (start-segment seg)) 
                 (y-point (end-segment seg)))) 
    )
))
(define pt1 (make-point 2 2))
(define pt2 (make-point 4 2))
(define pt3 (make-point 6 6))



(define (triangle pt1 pt2 pt3)
  (define seg-1 (make-segment pt1 pt2))
  (define seg-2 (make-segment pt1 pt3))
  (define seg-3 (make-segment pt2 pt3))
  
  (define perimeter
    (+ (length-segment seg-1)
      (length-segment seg-2)
      (length-segment seg-3) 
  ))

  (define (area s) 
    (let
      ((len-seg-1 (length-segment seg-1))
       (len-seg-2 (length-segment seg-2))
       (len-seg-3 (length-segment seg-3)))
    sqrt (* 
           s 
           (- s len-seg-1)
           (- s len-seg-2)
           (- s len-seg-3))
  ))
  
  (let ((s (/ perimeter 2)))
    (area s)
))

(triangle pt1 pt2 pt3)

