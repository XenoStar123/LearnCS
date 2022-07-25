#lang sicp
#|
;; ex 1.1
10
12
8
3
6
a=3 ;; Value: a
b=4 ;; Value: b
19
false ;; #f
4
16
6
16
|#

#|
;; ex 1.2 
(/ (+ 5 
      4 
      (- 2 (- 3 (+ 6 (/ 4 5))))) 
   (* 3 
      (- 6 2) 
      (- 2 7)))
;; Result is -0.24666666666666667, or -37/150 
|#

#|
;; ex 1.3
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

(define (sum-of-squares x y)
  (+ (square x) (square y)))

#|
(define (sum-of-squares-of-two-largest x y z)
  (let* ((smallest (min x y z))
         (two-largest (remove smallest (list x y z))))
    (apply sum-of-squares-of-two-largest)))
|#

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
|#

#|
;; ex 1.4
; (a + |b|) 
; A plus the absolute value of B

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -3)
(a-plus-abs-b 1 3)

(a-plus-abs-b 1 -3)
((if (> -3 0) + -) 1 -3)
((if #f + -) 1 -3)
(- 1 -3)
4

(a-plus-abs-b 1 3)
((if (> 3 0) + -) 1 3)
((if #t + -) 1 3)
(+ 1 3)
4
|#

#|
;; ex 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))

; 应用序
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))

; 正则序
; (test 0 (p))
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; 0
|#

#|
;; 牛顿法求平方根
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
|#

;; ex 1.6
#|
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(cond ((good-enough? guess x) guess)
      (else (sqrt-iter (improve guess x) x)))

loop (sqrt-iter (improve guess x) x)
|#

;; ex 1.7
#|
(define (good-enough? guess x)
  (< (/ (abs (- guess (improve guess x)))
        guess)
     0.001))


;original test 
;(define (good-enough? guess x) 
;  (< (abs (- (square guess) x)) 0.001)) 
  
;iterates until guess and next guess are equal, 
;automatically produces answer to limit of system precision 
(define (good-enough? guess x) 
  (= (improve guess x) guess))


;; Modified version to look at difference between iterations 
(define (good-enough? guess x) 
  (< (abs (- (improve guess x) guess)) 
     (* guess .001))) 
  
;;Alternate version, which adds an "oldguess" variable to the main function. 
(define (sqrt-iter guess oldguess x) 
  (if (good-enough? guess oldguess) 
      guess 
      (sqrt-iter (improve guess x) guess 
                 x))) 
  
  
(define (good-enough? guess oldguess) 
  (< (abs (- guess oldguess)) 
     (* guess 0.001))) 
  
(define (sqrt x) 
  (sqrt-iter 1.0 2.0 x))


;Another take on the good-enough? function 
  
(define (good-enough? guess x) 
  (< (/ (abs (- (square guess) x)) guess) (* guess 0.0001)))

; A guess is good enough when: 
;    abs(improved-guess - original-guess) / original-guess < 0.001 
  
(define (good-enough? guess x) 
  (< (abs (/ (- (improve guess x) guess) 
             guess)) 
     0.001))

(define (good-enough? guess x) 
  (< (abs (- x (square guess)))                                                                  
     (* 0.0001 x)))   
|#

#|
;; ex 1.8
(define (square guess) 
  (* guess guess)) 
  
;not used 
;(define (average x guess) 
;  (/ (+ x guess) 2)) 
  
;improve square root 
;(define (improve guess x) 
;  (average guess (/ x guess))) 
  
;cube root improve formula used as is 
(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)) 
  
;original test 
;(define (good-enough? guess x) 
;  (< (abs (- (square guess) x)) 0.001)) 
  
;iterates until guess and next guess are equal, 
;automatically produces answer to limit of system precision 
(define (good-enough? guess x) 
  (= (improve guess x) guess)) 
  
(define (3rt-iter guess x) 
  (if (good-enough? guess x) 
      guess 
      (3rt-iter (improve guess x) x))) 
  
;<<<expression entry point>>> 
;change initial guess to 1.1 to prevent an anomalous result for 
;cube root of -2 
(define (3root x) 
  (3rt-iter 1.1 x))
|#
