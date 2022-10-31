#lang sicp
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
