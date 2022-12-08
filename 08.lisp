(let* ((input (uiop:read-file-lines "08.input"))
       (rows (mapcar (lambda (row) (mapcar (lambda (c)
                                             (parse-integer (string c)))
                                           (coerce row 'list))) input))
       (m (length rows))
       (n (length (car rows)))
       (forest (make-array (list m n) :initial-contents rows)))

  (flet ((look (forest i j)
           (destructuring-bind (m n) (array-dimensions forest)
             (flet ((smaller? (ii jj) (> (aref forest i j) (aref forest ii jj))))
               (or
                (loop for ii from (1- i) downto 0 always (smaller? ii j))
                (loop for ii from (1+ i) below m always (smaller? ii j))
                (loop for jj from (1- j) downto 0 always (smaller? i jj))
                (loop for jj from (1+ j) below n always (smaller? i jj)))))))

    (print (destructuring-bind (m n) (array-dimensions forest)
             (loop for i from 0 below m sum (loop for j from 0 below n count (look forest i j))))))

  (flet ((look (forest i j)
           (destructuring-bind (m n) (array-dimensions forest)
             (flet ((smaller? (ii jj) (> (aref forest i j) (aref forest ii jj))))
               (*
                (loop for ii from (1- i) downto 0 sum 1 while (smaller? ii j))
                (loop for ii from (1+ i) below m sum 1 while (smaller? ii j))
                (loop for jj from (1- j) downto 0 sum 1 while (smaller? i jj))
                (loop for jj from (1+ j) below n sum 1 while (smaller? i jj)))))))

    (print (destructuring-bind (m n) (array-dimensions forest)
             (loop for i from 0 below n maximize (loop for j from 0 below m maximize (look forest i j)))))))
