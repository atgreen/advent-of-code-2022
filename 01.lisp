(ql:quickload :split-sequence)

(let ((cals (sort (mapcar (lambda (nums) (reduce #'+ (mapcar #'parse-integer nums)))
                          (split-sequence:split-sequence "" (uiop:read-file-lines "01.input") :test #'equal))
                  #'>)))
  (print (car cals))
  (print (+ (car cals) (cadr cals) (caddr cals))))
