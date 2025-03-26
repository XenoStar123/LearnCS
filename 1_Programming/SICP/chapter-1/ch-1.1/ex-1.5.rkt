#lang sicp
;; ex-1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; 应用序
; (test 0 (p))
; (if (= x 0) 0 y))
; (if (= 0 0) 0 (p)))
; (if (= 0 0) 0 (p)))
; ...
; (if (= 0 0) 0 (p)))


; 正则序
; (test 0 (p))
; (if (= x 0) 0 y))
; (if (= 0 0) 0 (p)))
; (true 0 (p)))
; 0
