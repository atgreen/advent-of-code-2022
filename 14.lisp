(ql:quickload :str)

(let ((cave (make-hash-table))
      (sand 0)
      (bottom 0))
  (flet ((compute-step (s e)
           (complex (if (eq (realpart (- s e)) 0)
                        0
                        (* 1 (if (< (realpart (- s e)) 0) 1 -1)))
                    (if (eq (imagpart (- s e)) 0)
                        0
                        (* 1 (if (< (imagpart (- s e)) 0) 1 -1))))))
    (loop for line in (uiop:read-file-lines "/home/green/git/advent-of-code-2022/14.input")
          do (loop with rock = (read-from-string (format nil "(~A)" (str:remove-punctuation line)))
                   and x = nil
                   and y = nil
                   while rock
                   do (progn
                        (unless x
                          (setf x (pop rock))
                          (setf y (pop rock)))
                        (let* ((nx (pop rock))
                               (ny (pop rock))
                               (start (complex x y))
                               (end (complex nx ny))
                               (step (compute-step start end)))

                          (loop with p = start
                                until (eql p end)
                                do (progn
                                     (setf (gethash p cave) :rock)
                                     (incf p step)))
                          (setf (gethash end cave) :rock)
                          (setf x nx)
                          (setf y ny)
                          (if (> y bottom)
                              (setf bottom y)))))))

  (block hit-void
    (loop with p = #c(500 0)
          do (progn
               (when (> (imagpart p) bottom)
                 (return-from hit-void))
               (cond ((null (gethash (+ p #c(0 1)) cave))
                      (setf p (+ p #c(0 1))))
                     ((null (gethash (+ p #c(-1 1)) cave))
                      (setf p (+ p #c(-1 1))))
                     ((null (gethash (+ p #c(1 1)) cave))
                      (setf p (+ p #c(1 1))))
                     (t
                      (print p)
                      (setf (gethash p cave) :sand)
                      (incf sand)
                      (setf p #c(500 0)))))))

  (format t "Star 1: ~A~%" sand)

  (loop for i from 0 to 1000
        do (setf (gethash (complex i (+ bottom 2)) cave) :rock))

  (block hit-top
    (loop with p = #c(500 0)
          do (progn
               (cond ((null (gethash (+ p #c(0 1)) cave))
                      (setf p (+ p #c(0 1))))
                     ((null (gethash (+ p #c(-1 1)) cave))
                      (setf p (+ p #c(-1 1))))
                     ((null (gethash (+ p #c(1 1)) cave))
                      (setf p (+ p #c(1 1))))
                     (t
                      (setf (gethash p cave) :sand)
                      (incf sand)
                      (when (eql p #c(500 0))
                        (return-from hit-top))
                      (setf p #c(500 0)))))))

  (format t "Star 2: ~A~%" sand))
