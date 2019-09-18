#lang racket

(define (accumulate-n op init seqs)
  (if (not (pair? (car seqs)))
    '()
    (cons 
      (accumulate op init (map car seqs))
      (accumulate-n op init (map cdr seqs) ))
))

(accumulate-n + 0 (list '(1 2 3) '(4 5 6) '(7 8 9) '(10 11 12)))