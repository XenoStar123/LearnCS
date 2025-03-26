#lang sicp
;; ex-1.3
(define (sum-of-large-two x y z)
  (if (> x y)
      (+ x
         (if (> y z)
             y
             z))
      (+ y
         (if (> x z)
             x
             z))))

(sum-of-large-two 1 2 3)
(sum-of-large-two 1 3 2)
(sum-of-large-two 2 1 3)
(sum-of-large-two 2 3 1)
(sum-of-large-two 3 1 2)
(sum-of-large-two 3 2 1)
