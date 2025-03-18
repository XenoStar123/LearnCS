#lang sicp
;; ex-1.3
;; v1
(define (square x) (* x x))

(define (squareSum x y) (+ (square x) (square y)))

(define (sumOfLargestTwoSquared x y z)
  (cond ((and (>= (+ x y) (+ x z)) (>= (+ x y) (+ y z))) (squareSum x y))
        ((and (>= (+ x z) (+ x y)) (>= (+ x z) (+ y z))) (squareSum x z))
        (else (squareSum y z))))

(sumOfLargestTwoSquared 1 2 3) 
;Value: 13 
(sumOfLargestTwoSquared 1 1 1) 
;Value: 2 
(sumOfLargestTwoSquared 1 2 2) 
;Value: 8 
(sumOfLargestTwoSquared 1 1 2) 
;Value: 5 
(sumOfLargestTwoSquared 1 4 3) 
;Value: 25

;; v2
(define (ssq x y) (+ (* x x) (* y y)))

(define (sumOfLargestTwoSquared2 x y z)
  (cond ((and (<= x y) (<= x z)) (ssq y z))
        ((and (<= y x) (<= y z)) (ssq x z))
        (else (ssq x y))))

(sumOfLargestTwoSquared2 1 2 3) 
;Value: 13 
(sumOfLargestTwoSquared2 1 1 1) 
;Value: 2 
(sumOfLargestTwoSquared2 1 2 2) 
;Value: 8 
(sumOfLargestTwoSquared2 1 1 2) 
;Value: 5 
(sumOfLargestTwoSquared2 1 4 3) 
;Value: 25

;; v3
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-of-two-largest x y z)
  (sum-of-squares (max x y) (max (min x y) z)))

(sum-of-squares-of-two-largest 1 2 3) 
;Value: 13 
(sum-of-squares-of-two-largest 1 1 1) 
;Value: 2 
(sum-of-squares-of-two-largest 1 2 2) 
;Value: 8 
(sum-of-squares-of-two-largest 1 1 2) 
;Value: 5 
(sum-of-squares-of-two-largest 1 4 3) 
;Value: 25
