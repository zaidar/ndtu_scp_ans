#lang racket



; (define (dot-product v w)
;   (accumulate + 0 (map * v w)))

(define (matrix-1) '((1.0 2.0 3.0)(4 5 6)(7 8 9)))



(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (cond ((null? rest) result)
          ((pair? rest) (op (iter initial (cdr rest)) (car rest)) )
          (else '() ) ))
  (iter initial sequence))

(fold-left / 1 (car(matrix-1)))
(fold-right / 1 (car(matrix-1)))

(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

