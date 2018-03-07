#lang racket

(define includes?
  (lambda (l i)
    (cond
      ((null? l) #f)
      (eq? (car l) i #t)
      (includes? cdr (l) i)
      (else #f))))
