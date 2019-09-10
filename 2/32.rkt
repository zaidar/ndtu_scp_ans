#lang racket


(define (square x )(* x x x) )

(define (map proc items)
  (if (null? items)
    null
    (cons (proc (car items))
          (map proc (cdr items)))
)); (map (lambda (x) (* x x)) (list 1 2 3 4))

(define (square-tree tree)
    (map (lambda (subtree)
             (if (pair? subtree)
                 (square-tree subtree)
                 (square subtree)))
         tree))

(define tree (list 1 2 3 4 5 6 7 8 9 10))
(square-tree tree)