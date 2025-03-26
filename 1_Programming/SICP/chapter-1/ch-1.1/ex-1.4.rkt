#lang sicp
;; ex-1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 3) ; 4
(a-plus-abs-b 1 -3) ; 4
; 表示a+"b的绝对值"
