#lang racket
(define empty-board '())

(define (adjoin-position row col board)
    (cons (list row col) board))

(define (row board)
    (map car board))
    
(define (col board)
    (map cadr board))
    
(define (safe? k board)
    (define (member-test val seq)
        (cond ((null? seq) true)
              ((= val (car seq)) false)
              (else (member-test val (cdr seq)))))
    (define (comparison-test seq1 seq2)
        (cond ((null? seq1) true)
              ((= (car seq1) (car seq2)) false)
              (else (comparison-test (cdr seq1) (cdr seq2)))))
    (let ((rows (row board))
          (cols (col board)))
         (and (member-test (car rows) (cdr rows))
              (member-test (car cols) (cdr cols))
              (comparison-test (map (lambda (i) (abs (- i (car rows))))
                                    (cdr rows))
                               (map (lambda (i) (abs (- i (car cols))))
                                    (cdr cols))))))
(define (accumulate op initial sequence) 
  (if (null? sequence) 
   initial 
   (op (car sequence) 
     (accumulate op initial (cdr sequence))))) 

(define (flatmap proc seq) 
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
        (enumerate-interval (+ low 1) high))))
  
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
             (lambda (positions) (safe? k positions))
             (flatmap
              (lambda (rest-of-queens)
                  (map (lambda (new-row)
                           (adjoin-position new-row
                                            k
                                            rest-of-queens))
                       (enumerate-interval 1 board-size)))
              (queen-cols (- k 1))))))
    (queen-cols board-size))

    (queens 5)