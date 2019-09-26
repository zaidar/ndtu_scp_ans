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
  (prime? (+ (car pair) (cadr pair) (caddr pair))
))
; (prime-sum? (list 1 5 5))

(define (make-triple-sum pair)  (list (car pair) (cadr pair) (caddr pair) (+ (car pair) (cadr pair) (caddr pair)) ))


(define (unique-triples n) (
  flatmap (
    lambda(i) (
      flatmap ( lambda(j) (
        map (lambda(k) ( 
          list i j k ) ) 
      (enumerate-interval 1 (- j 1) ) ) ) 
   (enumerate-interval 1 (- i 1) ) ) )
    
  (enumerate-interval 1 n)))


; (enumerate-interval 1 (- i 1) ) ) )
;       (enumerate-interval 1 n)
(define (prime-sum-pairs n)
  (map make-triple-sum
    (filter prime-sum? (unique-triples n))
))

; (prime-sum-pairs 5)

(define (triples-that-sum-to s n) (
  filter (lambda (e) (or (< (cadddr e ) s) (= (cadddr e) s) ) )
    (prime-sum-pairs n)
))

; (triples-that-sum-to 16 7)
; .... ((7 4 2 13)) ((7 5 1 13)))
; (triples-that-sum-to 17 7)
; .... ((7 4 2 13)) ((7 5 1 13)) ((7 6 4 17)))

; (map (lambda(g) (
;   map (lambda(e) (
;     if (< e 25) 
;         (list (car g) (cadr g) (caddr g) (cadddr g) ) 
;         '()) ) (cadddr g) ) )


; (prime-sum-pairs 5 ))




; (caddr (prime-sum-pairs 5))
; (prime-sum-pairs 7 )
; (unique-triples 4)

(define (permutations s)
  (if (null? s) ; empty set?
    (list '()) ; sequence containing empty set
    (flatmap (lambda (x)
      (map (lambda (p) (cons x p))
      (permutations (remove x s))))
    s)
))
; (unique-triples 4)
; (permutations (unique-triples 4))