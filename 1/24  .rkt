#lang racket 

(define (fib n)
  (fib-iter 1 0 0 1 n
))

(define (square x) (* x x))

(define (fib-iter a b p q count)
  (cond((= count 0) b)
      ((even? count)
        (fib-iter
        a b
        (+ (square p) (square q))
        (+ (* 2 p q) (square q))
        (/ count 2)))
        (else
          (fib-iter (+ (* b q) (* a q) (* a p))
                       (+ (* b p)(* a q)) 
                       p q 
                       (- count 1)))
))

(fib 7)


; (define (matrix a b c d)
;   (lambda (p) (p a b c d)))

; (define (mmul x y)
;   (x (lambda (xa xb xc xd)
;        (y (lambda (ya yb yc yd)
;             (matrix (+ (* xa ya) (* xb yc))
;                     (+ (* xa yb) (* xb yd))
;                     (+ (* xc ya) (* xd yc))
;                     (+ (* xc yb) (* xd yd))))))))

; (define (mpow m n p) 
;     (define (iter a q n)
;       (cond ((= n 0) (a p))
;             ((= 0 (modulo n 2))
;              (iter a
;                    (mmul q q)
;                    (/ n 2)))
;             (else
;              (iter (mmul a q)
;                    (mmul q q)
;                    (/ (- n 1) 2)))))
;     (iter (matrix 1 0 0 1) m n))

; (define (fib n)
;     (define (p a b c d) a)
;     (mpow (matrix 0 1 1 1) n p))

; (fib 7)