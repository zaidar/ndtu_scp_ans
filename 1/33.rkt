#lang racket
(define (factorial n)
  (define (iter product counter)
    ( if (> counter n) product
      (iter (* counter product)(+ counter 1))
    )
  )
  (iter 1 1)
)
(displayln (factorial 2 ))
(displayln (factorial 3))
(displayln (factorial 4))
(displayln (factorial 5))