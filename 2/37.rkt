#lang racket

(define (accumulate op initial sequence) 
    (if (null? sequence) initial
        (op 
          (car sequence) 
          (accumulate op initial (cdr sequence)))
))
(define (accumulate-n op init seqs)
  (if (not (pair? (car seqs)))
    '()
    (cons 
      (accumulate op init (map car seqs))
      (accumulate-n op init (map cdr seqs) ))
))

; (map car (list '(1 2 3) '(4 5 6) '(7 8 9) '(10 11 12)))

; (define (dot-product v w)
  ; (accumulate + 0 (map * v w)))

(define (matrix-1) (list 1 2 3 ))
(define (matrix-2) (list '(1 2 3) '(4 5 6) '(7 8 9)) )

; (dot-product (matrix-1) (matrix-1))


 (define (matrix-*-vector m v)
   (map ( lambda (row)(map * v row)) m))
; (matrix-*-vector (matrix-2) (matrix-1))


; (define x (lambda (e x)(* e x)))
; (x 4 5)
; (map * '(1 2 3) '(1 2 3))

(define (transpose mat) 
   (accumulate-n cons '() mat)
)
; (transpose (matrix-2))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
  (map (lambda (e) (accumulate-n + 0 (transpose(matrix-*-vector cols e)))) m)))
  
(matrix-*-matrix (matrix-2)(matrix-2))

; '((30 36 42) (66 81 96) (102 126 150))