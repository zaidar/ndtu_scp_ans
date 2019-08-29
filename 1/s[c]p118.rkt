#lang racket



(define (cube-iter x y)
  
  (define (square x)
    (* x x))
  
  (define (cube x)
    (* x x x))
  
  (define (good-enough? x y)
    (< (abs (- (cube y) x)) 0.001))

  (define (improve x y)
    (/ (+ (/ x (square y)) (* 2 y)) 3))
  
  (if (good-enough? x y)
    y
    (cube-iter x (improve x y) )))

(define (cubetx x)
  (cube-iter x 1.0))

(cubetx 8)
