(ql:quickload :fset)

(let ((input (uiop:read-file-lines "03.input")))

  (print (loop for line in input
               sum (let* ((l (length line))
                          (c (char-int (fset:arb (fset:intersection
                                                  (fset:convert 'fset:set (subseq line 0 (/ l 2)))
                                                  (fset:convert 'fset:set (subseq line (/ l 2))))))))
                     (if (<= 65 c 90) (- c 38) (- c 96)))))

  (print (loop while input
               sum (let ((c (char-int (fset:arb (reduce #'fset:intersection
                                                          (list (fset:convert 'fset:set (pop input))
                                                                (fset:convert 'fset:set (pop input))
                                                                (fset:convert 'fset:set (pop input))))))))
                     (if (<= 65 c 90) (- c 38) (- c 96))))))
