#lang sicp
;; ex-1.8
(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) (* guess 0.0001)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cube x)
  (* (square x) x))

(cbrt 81)
(cube (cbrt 81))
