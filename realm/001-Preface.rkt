#lang racket
#|

REALM OF RACKET
--------------------------------------------------------------------------------

PREFACE
-------
Lisp is a highly expressive language. With Lisp, you take the most complicated
problems and express their solutions in a clear and appropriate way. If Lisp
doesn't have the means to do so, you change Lisp.
Lisp comes from the ideas of Alonzo Church: The Lambda Calculus. In this calcu-
lus everything is a function. A computer language means nothing but a fairly
thin veil over the underlying hardware. Programming languages needed to evolve
to survive beyond the confines of a specific machine, so a new software arrived:
compilers and interpreters.
A compiler can take something that looks like plain arithmetic and convert it to
a format that the computer can execute.
An interpreter is similar, although it performs the actions described in a human
written program directly; there is no intermediate step that converts it all the
way down to a computer format.

To deal with lists, a program should provide lists and functions for processing
lists -ignoring how the computer really deals with them inside. Better still, a
language should be able to "talk" aobut itself and about programming. In short,
Lisp should be a language so elegant and so powerful that even writing an in-
terpreter for Lisp in Lisp itself would take a small amount of computer code.

What does Lisp look like?
-------------------------
Here are some valid Lisp expressions:
|#

(* 1 1)
(- 8 (* 2 3))
(sqrt 9)

#|
Prefix notation allows as to supply a lot of arguments at once in an easy way.
With Lisp we never have the precedence problem, we never get confused:
|#

(+ 1 2 3 4 5 6)               ; A lot of  arguments are easy to pass.
(sqrt (+ (sqrt 3) (sqrt 4)))  ; Precedence is not a problem.

#|
In the last expression, you see a deeply nested expression, and yet the paren-
theses immediately tell you in which order things are evaluated. The parenthe-
ses also tell you what operators are involved, because you know that every left
parenthesis -called "open" when lisppers speak- is followed by an operator. And
the right parentheses are called... "close".

Lisp isn't just about numbers or arithmetc; it's also about list procesing. So
you should be curious about what lists look like in Lisp.
Here are some examples:
|#

(list 1 2 3 4 5 6 7 8 9 0)
(list (list 1 3 5 7 9) (list 2 4 6 8 0))
(list (list 'hello 'world)
      (list (list 'it 'is) 2063)
      (list 'and 'we 'love 'Racket))

#|
A language that is about lists has even a better way to write lists. By adding
a quote to the left of a piece of Lisp code, we turn it into a piece of data.
So the following expressions are equivalent:
|#

'(sqrt (+ (sqr 3) (sqr 4)))
(list 'sqrt
      (list '+
            (list 'sqr 3)
            (list 'sqr 4)))

