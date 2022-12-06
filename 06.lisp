(let ((input (uiop:read-file-string "06.input")))
  (flet ((find-start (len)
           (loop for i from 0 to (length input)
                 until (eq (length (remove-duplicates (subseq input i (+ i len)))) len)
                 finally (return (+ i len)))))
    (print (find-start 4))
    (print (find-start 14))))
