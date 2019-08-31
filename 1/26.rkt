#lang racket

(define (cube x)(* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if(not (> (abs angle) 0.00000001))
    angle
    (p (sine (/ angle 3.0)))
))

(sine 121.5)