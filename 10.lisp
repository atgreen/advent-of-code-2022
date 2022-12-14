(loop for insn in (uiop:read-file-lines "10.input")
      with cycle = 0 and crt = 0 and x = 1 and star1 = 0
      until (not insn)
      do (flet ((tick ()
                  (format t "~A" (if (<= (abs (- crt x)) 1) "#" "."))
                  (when (eq (incf crt) 40)
                    (setf crt 0)
                    (terpri))
                  (when (eq (mod (incf cycle) 40) 20)
                    (incf star1 (* cycle x)))))
           (if (eq (char insn 0) #\n)
               (tick)
               (progn
                 (tick) (tick) (incf x (parse-integer insn :start 5)))))
      finally (print star1))
