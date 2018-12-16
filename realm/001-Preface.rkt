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
(sqrt 9)
(list 1 2 3 4 5 6)
