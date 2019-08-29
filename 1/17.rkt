#lang racket
(define (sqrt-iter guess x)

  (define (square x)
    (* x x))

  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.00000001))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrtx x)
  (sqrt-iter 1.0 x))
    (sqrtx 9)
