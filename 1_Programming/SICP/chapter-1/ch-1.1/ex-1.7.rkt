#lang sicp
;; ex-1.7
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
