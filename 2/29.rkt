#lang racket

; (define (list x . z)
;   (define (list-iter items)
;     (if (empty? items)
;       items
;       (cons (car items) (list-iter (cdr items)))
;   ))
;   (cons x (list-iter z) )
; ) ;(list 1 5 3 4 5)

; (define (list x . z)
;   (define (list-iter items y)
;     (if (empty? items)
;       items
;       (cons (* (car items) y) (list-iter (cdr items) y))
;   ))
;   (lambda (y) (cons (* x y) (list-iter z y)) )) ;((list 1 5 3 4 5) 10)

; (define (list x . z)
;   (if(empty? x)
;     x
;     (cons x (list z))
; )) ;(list 2 3 4 5 6)


; (define (list x . z)
;   (lambda (y) 
;     (if (empty? x)
;       x
;       (cons (* x y) ((list z) y) ))
; ))

; ((list 1 2 3 4 5) 10)


; (define (func x . y)
;   (define (iter items factor) 
;     (let ((x (car items)) 
;           (y (cdr items)))
;     (if (pair? y)
;       (cons (* x factor) (iter y factor)) 
;       (* x factor)
;   )))
;   (lambda (factor) (cons (* x factor) (iter y factor)) )
; ); ((func 1 2 3 4 5) 10)


; (define (map proc items)
;   (if (null? items)
;     null
;     (cons (proc (car items))
;           (map proc (cdr items)))
; )); (map (lambda (x) (* x x)) (list 1 2 3 4))

(define (make-mobile left right)
    (cons left right))

(define (make-branch length structure)
    (cons length structure))

(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (caar mobile))

(define smth (make-mobile (make-mobile 2 4) (make-mobile (make-mobile 5 6) 6)))

(right-branch smth)

(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (cadr branch))