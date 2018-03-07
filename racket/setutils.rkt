#lang racket

(define includes?
  (lambda (l i)
    (cond
      ((null? l) #f)
      ((eq? (car l) i) #t)
      ((includes? (cdr l) i))
      (else #f))))

(define isSet?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((includes? (cdr l) (car l)) #f)
      ((isSet? (cdr l)))
      (else #f))))
