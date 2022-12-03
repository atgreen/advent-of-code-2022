# Advent of Code 2022 in Common Lisp

I'm using the Advent of Code 2022 to exercise my Common Lisp muscles.

https://adventofcode/2022

Learnings
---------

Learnings from 2021: https://github.com/atgreen/advent-of-code-2021/blob/main/README.md
Learnings from 2020: https://github.com/atgreen/advent-of-code-2020/blob/main/README.md

Here are some of my personal learnings from 2022.

* `reduce` has a keyword arg `:key` that you can use to transform values with: `(reduce #\+ list-of-strings :key #'parse-integer)`


Anthony Green <green@redhat.com>
