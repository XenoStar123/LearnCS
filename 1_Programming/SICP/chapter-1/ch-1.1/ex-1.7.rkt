#lang sicp
;; ex-1.7
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; 小数good-enough?很难收敛
(square (sqrt 0.00000134))
; 大数square会超过上限
(square(sqrt 134243443255))

(define (good-enough2? guess x)
  (< (/ (abs (- guess (improve guess x))) guess) 0.001))

;   (< (/ (abs (- guess (improve guess x))) guess)) 0.0001)


(define (sqrt-iter2 guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

; 小数good-enough?很难收敛
(square (sqrt2 0.00000134))
; 大数square会超过上限
(square (sqrt2 134243443255))

(square (sqrt2 9))
