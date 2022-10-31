#lang sicp
;; ex-1.4
; (a + |b|) 
; A plus the absolute value of B

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (a-plus-abs-b 1 -3)
; (a-plus-abs-b 1 3)

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
