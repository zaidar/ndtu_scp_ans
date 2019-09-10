#lang racket


(define (accumulate op initial sequence) 
    (if (null? sequence) initial
        (op 
          (car sequence) 
          (accumulate op initial (cdr sequence)))
))

(define (flatmap proc seq) 
    (accumulate append null (map proc seq)))

(define (remove item sequence) 
    (filter 
        (lambda (x) (not (= x item))) 
        sequence))

(define (permutations s) 
    (if (null? s) 
        (list null)
        (flatmap (lambda (x)
          (map 
            (lambda (p) (cons x p)) 
            (permutations (remove x s)))) s
        )
  ))

  (permutations (list 1 2 3))