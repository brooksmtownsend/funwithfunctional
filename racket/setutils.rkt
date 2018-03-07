#lang racket

(define includes?
  (lambda (l i)
    (cond
      ((null? l) #f)
      ((eq? (car l) i))
      ((includes? (cdr l) i))
      (else #f))))

(define isSet?
  (lambda (l)
    (cond
      ((null? l))
      ((includes? (cdr l) (car l)) #f)
      ((isSet? (cdr l)))
      (else #f))))

(define isSubset?
  (lambda (a b)
    (cond
      ((null? a))
      ((null? b) #f)
      ((not (includes? b (car a))) #f)
      ((isSubset? (cdr a) b))
      (else #f))))

(define isSuperset?
  (lambda (a b)
    (cond
      ((null? b))
      ((null? a) #f)
      ((not (includes? a (car b))) #f)
      ((isSuperset? a (cdr b)))
      (else #f))))

(define isStrictSubset?
  (lambda (a b)
    (cond
      ((null? a))
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

(define union
  (lambda (a b)
    (cond
      ((null? a) b)
      ((null? b) a)
      ((includes? a (car b)) (union a (cdr b)))
      (else (cons (car b) (union a (cdr b)))))))

(define intersect
  (lambda (a b)
    (cond
      ((or (null? a) (null? b)) `())
      ((includes? a (car b)) (cons (car b) (intersect a (cdr b))))
      (else (intersect a (cdr b))))))

(define subtract
  (lambda (a b)
    (cond
      ((null? a) `())
      ((null? b) a)
      ((not (includes? b (car a))) (cons (car a) (subtract (cdr a) b)))
      (else (subtract (cdr a) b)))))


      
      




      