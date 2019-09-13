#lang racket


(define (equal? aterm bterm)
  (cond ((eq? aterm bterm) #t)
        ((and (pair? aterm) (pair? bterm) (equal? (car aterm)(car bterm)))
          (equal? (cdr aterm) (cdr bterm)))


        (else #f)
))

(equal? '(5 '(5 5 5) 5) '(5 '(5 5) 5))
(equal? '(5 5 5) '(5 5 5) )
