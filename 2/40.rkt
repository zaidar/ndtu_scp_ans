#lang racket

(define (square x )(* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond 
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
  (else (find-divisor n (+ test-divisor 1)))
))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)
))

(define (accumulate op initial sequence) 
    (if (null? sequence) initial
        (op 
          (car sequence) 
          (accumulate op initial (cdr sequence)))
))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))
))

;   (accumulate append '()
;     (map (lambda (i)
;       (map (lambda (j) (list i j))
;     (enumerate-interval 3 (- i 1))))
;     (enumerate-interval 3 7)
; ))

; (accumulate append '() (
;   map (lambda (j) (list  j ) ) (list 1 2 3 4 5 6)
; ))

; (accumulate append '() (
;   map (lambda (j)  (
;     map (lambda (i)(list (cons i j) )) (list  '/#1 '/# '/# '/# '/#)))
    
;     (list 1 2 3 4 5 6)
; ))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)
))
; (flatmap (lambda (x)(list x)) 
;   (list ( map (lambda (y) (+ y 1)) (list 1 2 3 4)) 
;         ( (lambda (y) y) (list 1 2 3 4)) ))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))
))
; (prime-sum? (list 1 5 5))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  
(define (unique-pairs n) (
    flatmap
        (lambda (i)
          (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1) ) ) )
      (enumerate-interval 1 n)
))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? (unique-pairs n)
       )
))

(prime-sum-pairs 5)

(define (permutations s)
  (if (null? s) ; empty set?
    (list '()) ; sequence containing empty set
    (flatmap (lambda (x)
      (map (lambda (p) (cons x p))
      (permutations (remove x s))))
    s)
))