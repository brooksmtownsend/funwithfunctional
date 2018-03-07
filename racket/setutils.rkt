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

(define isSubset?
  (lambda (a b)
    (cond
      ((null? a) #t)
      ((null? b) #f)
      ((not (includes? b (car a))) #f)
      ((isSubset? (cdr a) b))
      (else #f))))

(define isSuperset?
  (lambda (a b)
    (cond
      ((null? b) #t)
      ((null? a) #f)
      ((not (includes? a (car b))) #f)
      ((isSuperset? a (cdr b)))
      (else #f))))

(define isStrictSubset?
  (lambda (a b)
    (cond
      ((null? a) #t)
      ((null? b) #f)
      ((and (isSubset? a b) (not (isSuperset? a b))))
      (else #f))))

(define isSetEqual?
  (lambda (a b)
    (cond
      ((and (null? a) (null? b)))
      ((null? a) #f)
      ((null? b) #f)
      ((and (isSubset? a b) (isSuperset? a b)))
      (else #f))))


      




      