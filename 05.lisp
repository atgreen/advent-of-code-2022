(let ((lines (uiop:read-file-lines "05.input"))
      (towers (make-array 10 :initial-element nil)))
  (flet ((play (move-fn)
           (loop for i from 7 downto 0
                 do (loop for c from 1 to 36 by 4
                          do (let ((l (aref (nth i lines) c)))
                               (when (not (eq #\Space l))
                                 (push l (aref towers (/ (+ c 3) 4)))))))
           (dolist (line (nthcdr 10 lines))
             (let ((moves (read-from-string (format nil "#(~A)" (remove-if #'alpha-char-p line)))))
               (funcall move-fn towers moves)))
           (loop for i from 1 to 9 do (print (car (aref towers i))))))
    (print "star 1")
    (play (lambda (towers moves)
            (loop for m from 1 to (aref moves 0)
                  do (push (pop (aref towers (aref moves 1))) (aref towers (aref moves 2))))))
    (print "star 2")
    (play (lambda (towers moves)
      (let ((new-tower (nthcdr (aref moves 0) (aref towers (aref moves 1)))))
        (setf (aref towers (aref moves 2)) (append (subseq (aref towers (aref moves 1)) 0 (aref moves 0)) (aref towers (aref moves 2))))
        (setf (aref towers (aref moves 1)) new-tower))))))
