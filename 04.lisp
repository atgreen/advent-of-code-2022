(ql:quickload :parseq)
(ql:quickload :alexandria)

(parseq:defrule num () (rep (1 2) digit) (:string) (:function #'parse-integer))
(parseq:defrule line () (and num "-" num "," num "-" num)
  (:lambda (s1 i1 e1 i2 s2 i3 e2)
    (cons (alexandria:iota (+ 1 (- e1 s1)) :start s1) (alexandria:iota (+ 1 (- e2 s2)) :start s2))))

(print (loop for l in (mapcar (lambda (l) (parseq:parseq 'line l)) (uiop:read-file-lines "04.input"))
             count (let ((i (length (intersection (car l) (cdr l)))))
                     (or (equal (length (car l)) i) (equal (length (cdr l)) i)))))

(print (loop for l in (mapcar (lambda (l) (parseq:parseq 'line l)) (uiop:read-file-lines "04.input"))
             count (intersection (car l) (cdr l))))
