#lang sicp
#|
;; ex 1.9
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4 5)

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)

9
;; 递归计算过程

(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)

9
;; 迭代计算过程

发现第一个过程是递归(不写出替换)的最简单方法是
注意“+”过程在嵌套在另一个表达式中时在末尾调用自身;
第二个调用自身,但作为顶部表达式。
|#

#|
;; ex 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

#|
(A 1 10)
(A (- 1 1) (A 1 (- 10 1)))
(A (- 1 1) (A 1 9))
(A (- 1 1) (A (- 1 1) (A 1 (- 9 1))))
(A (- 1 1) (A (- 1 1) (A 1 8)))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 8 1)))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 7))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 7 1))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 6)))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 6 1)))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 5))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 5 1))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 4)))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 4 1)))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 3))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 3 1))))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 2)))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 (- 2 1)))))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 1 1))))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) 2)))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 2)))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 2)))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 4))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 4))))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 8)))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 8)))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 16))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 16))))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 32)))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 32)))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (A 0 64))))
(A (- 1 1) (A (- 1 1) (A (- 1 1) (* 2 64))))
(A (- 1 1) (A (- 1 1) (A 0 128)))
(A (- 1 1) (A (- 1 1) (* 2 128)))
(A (- 1 1) (A 0 256))
(A (- 1 1) (* 2 256))
(A 0 512)
(* 2 512)

1024
|#

(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024
;; 递归计算过程

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 (A 0 (A 0 4)))
(A 1 (A 0 8))
(A 1 16)
;2^16
;65536

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 4)
;2^16
;65536

(define (f n) (A 0 n))
(A 0 n)
(* 2 n)
2n

(define (g n) (A 1 n))
2^n

(define (h n) (A 2 n))
2^2^n

(define (k n) (* 5 n n))
5n^2

(f n): 2n
(g n): 0 for n=0, 2^{n} for n>0
(h n): 0 for n=0, 2 for n=1, 2^(2^(2^(2...(n times)))) for n>1
|#

#|
;; Fibonacci
; recursive
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; iterative
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
|#

#|
;; count-change
; recursive
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 10)
|#

#|
;; ex 1.11
; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; iterative
(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (foo n) 
  (define (foo-iter a b c n1) 
    ;; a = f(n1 - 1), b = f(n1 - 2), c = f(n1 - 3). 
    ;; return a + 2b + 3c 
    (if (< n1 3) 
        a 
        (foo-iter (+ a (* 2 b) (* 3 c)) a b (- n1 1)))) 
  (if (< n 3) 
      n 
      (foo-iter 2 1 0 n))) 
|#

#|
;; ex 1.12
(define (p-triangle m n)
  (if (or (= m 1) (= n 1) (= n m))
      1
      (+ (p-triangle (- m 1) (- n 1))
               (p-triangle (- m 1) n))))
|#

;; ex 1.13
;n=0, fib(n)=0
;n=1, fib(n)=1
;n>1, fib(n)=fib(n-1)+fib(n-2)
;x^2=x+1
;n=0
;数学归纳法

;; ex 1.14
; ./chapter1.2-count-change.dio
; steps  O(fai^n)
; space: O(n)

#|
;; ex 1.15
(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))

; a) call 5 times p produce
; b) steps  O(log3n)
;    space: O(log3n)
|#

;; 求幂(exponentiation)
; recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
; iterative
(define (expt-iter b n res)
  (if (= n 0)
      res
      (expt-iter b (- n 1) (* res b))))

(define (expt-i b n)
  (expt-iter b n 1))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

;; ex 1.16
(define (fast-expt-i b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(fast-expt-i 2 0)
(fast-expt-i 2 1)
(fast-expt-i 2 2)
(fast-expt-i 2 3)
(fast-expt-i 2 4)
(fast-expt-i 2 5)
(fast-expt-i 2 6)
(fast-expt-i 2 7)
(fast-expt-i 2 8)
(fast-expt-i 2 9)
(fast-expt-i 2 10)

;; ex 1.17
#|
(define (* a b)
  (if (= (b 0))
      0
      (+ a (* a (- b 1)))))
|#

;double halve
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

; recursive
(define (*-r a b)
  (cond ((= b 0) 0)
        ((even? b) (double (*-r a (halve b))))
        (else (+ a (*-r a (- b 1))))))

; iterative
(define (*-i a b)
  (*-iter a b 0))

(define (*-iter a counter result)
  (cond ((= counter 0) result)
        ((even? counter) (*-iter (double a) (halve counter) result))
        (else (*-iter a (- counter 1) (+ result a)))))

