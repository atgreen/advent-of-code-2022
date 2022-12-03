(let ((input (uiop:read-file-lines "03.input")))

  (print (loop for line in input
               sum (let* ((l (length line))
                          (c (char-int (car (intersection (coerce (subseq line 0 (/ l 2)) 'list)
                                                          (coerce (subseq line (/ l 2)) 'list))))))
                     (if (<= c 90) (- c 38) (- c 96)))))

  (print (loop while input
               sum (let ((c (char-int (car (reduce #'intersection
                                                     (list (coerce (pop input) 'list)
                                                           (coerce (pop input) 'list)
                                                           (coerce (pop input) 'list)))))))
                     (if (<= c 90) (- c 38) (- c 96))))))
