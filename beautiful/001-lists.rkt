#lang racket
#|
BEAUTIFUL RACKET
--------------------------------------------------------------------------------
Lists
-----
The list is the fundamnetal data structure of Racket. A list is a sequence of
values. A list can contain any kind of value, including other lists. A list can
contain any number of values. If a list has zero values, it's called the empty
list


 ()                              ; the empty list
 (1 2 3)                         ; three numbers
 ("a" "b" "c" "d")               ; four strings
 ( 1 2 3 ("a" "b" "c" (4 5 6)))  ; list with sublists


List Notation
-------------
Any time you put values between parentheses, you're making a list. By default,
square and curly brackets work the same as parentheses, so these lists are the
same:

 ( 1 2 3 ("a" "b" "c" (4 5 6)))
 [ 1 2 3 ["a" "b" "c" [4 5 6]]]
 { 1 2 3 ["a" "b" "c" (4 5 6)]}

In practice, parentheses are preferred, and square and curly brackets are re-
served for special situations where they improve readability, for instance the
variables introduced at the top of a let:
|#

(let ([x 42]
      [y 58])
  (* x y))

#|
If you type a list in a Racket program, by default, it will be interpreted as
Racket code:

 (* 42 58)    ; prints 2436
 (1 2 3)      ; error: 1 is not a function
 ()           ; error: missing procedure
 (a b c)      ; error: `a` is not defined

To make a list of values that will be evaluated as data, not code, use the list
function:
|#

(list * 42 58)      ; prints '(#<procedure:*> 42 58)
(list 1 2 3)        ; prints '(1 2 3)
(list)              ; prints '()

#|
However, doing the following will result in an error:

 (list a b c)        ; error: `a` is not defined

Alternatively, you can make a special kind of list with quote, called a datum.
quote can be used as a function. But the idiomatic way to use it is by adding
a ' prefix to any expression. Below, some datums made with quote, and the
equivalent list notation on the right
|#

(quote (* 42 58))     ; (list '* '42 '58)
'(* 42 58)            ; (list '* '42 '58)
'(1 2 3)              ; (list '1 '2 '3)
'()                   ; (list)
'(a b c)              ; (list 'a 'b 'c)

#|
Caution: depending on the input, list and quote may or may not produce the same
output list. For instance, Racket deems numbers, strings, and Booleans to be
"self-quoting" -meaning, they're already in datum form- so their meaning isn't
changed by quote. For these values, list and quote (and by extension, the '
prefix) can be used interchangeably:
|#

(equal? (list 1 2 3) '(1 2 3))                 ; => true
(equal? (list "a" "b" #t) '("a" "b" #t))       ; => true

#|
But other values, like variables and expressions, are not self-quoting, so list
and quote produce different results:
|#

(list + (* 6 7))                         ; a list of one function and one number
'(+ (* 6 7))                             ; a list of symbols and numbers
(list '+ '(* 6 7))                       ; also a list of symbols and numbers
(equal? (list + (* 6 7)) (list + 42))    ; true
(equal? (list + (* 6 7)) '(+ (* 6 7)))   ; false
(equal? (list '+ '(* 6 7)) '(+ (* 6 7))) ; true

