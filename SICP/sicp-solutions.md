# 1 构造过程抽象

## 1.1 小练习

```scheme
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
```

## 1.2 前缀表达式

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;; ex 1.2 
  
 (/ (+ 5 
       4 
       (- 2 (- 3 (+ 6 (/ 4 5))))) 
    (* 3 
       (- 6 2) 
       (- 2 7))) 
  
 ;; Result is -0.24666666666666667, or -37/150 
```

## 1.3 三个数中的最大值

```scheme
#lang sicp
(define (max a b c)
  (if (> a b)
      (if (> a c)
          a
          c)
      (if (> b c)
          b
          c)))
 
```

## 1.4 复合表达式

a加b的绝对值

## 1.5 应用序和正则序

```scheme
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

# 应用序
(test 0 (p))

(if (= 0 0)
    0
    (p))

0

# 正则序
(test 0 (p))


```

