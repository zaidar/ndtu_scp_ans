#lang racket

; (define (element-of-set? x set)
;   (define (element-count el set count)
;     (cond ((null? set) count) 
;           ((equal? x (car set)) (element-count el (cdr set) (+ count 1))) 
;           (else (element-count x (cdr set) count))
;     ))
;   (element-count x set 0))

(define (element-of-set? x set) 
  (cond ((null? set) false) 
    ((equal? x (car set)) true) 
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set-1 set-2 ) (
 append set-1 set-2
))
; (define set-1 '(a b c))
; (define set-2 '(a c d e e))
; (union-set set-1 set-2)

; (define (intersection-set set-1 set-2)
;   (cond 
;         ((or (null? set-1) (null? set-2)) '() )
;         ((and (element-of-set? (car set-1) (cdr set-1)) (element-of-set? (car set-1) set-2) ) 
;               (cons (car set-1) (intersection-set (cdr set-1)  set-2)) )
;         ((and (element-of-set? (car set-2) (cdr set-2)) (element-of-set? (car set-2) set-1) ) 
;             (cons (car set-2) (intersection-set set-1 (cdr set-2))) )
;         ((element-of-set? (car set-1) set-2) (cons (car set-1) (intersection-set (cdr set-1) set-2)) )
;         (else (intersection-set (cdr set-1) set-2))
; ))

; (define set-1 '(2 3 3 3 5 5 5))
; (define set-2 '(2 2 2 2 3 5 5))
; (intersection-set set-1 set-2)
;'(2 2 2 2 3 3 3 5 5 5)



; (define (accumulate op initial sequence) 
;     (if (null? sequence) initial
;         (op 
;           (car sequence) 
;           (accumulate op initial (cdr sequence)))
; ))
; (filter (lambda (e)(not( equal? e '()) ) ) (accumulate append '() (map (lambda (y)
;  (map (lambda (x) (
;     if (equal? x y ) x '() )) set-1)
;  ) set-2) ))
;  (define set-1 '(1 1 1 2 3 4 5 5) )
; (define set-2 '(1 1 2 2 2 2 3 4 5 5))
; '(1 1 1 1 1 1 2 2 2 2 3 4 5 5 5 5)
