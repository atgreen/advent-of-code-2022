(let ((input (uiop:read-file-lines "02.input")))
  (print (loop for round in input sum (/ (search round "   B XC YA ZA XB YC ZC XA YB Z") 3)))
  (print (loop for round in input sum (/ (search round "   B XC XA XA YB YC YC ZA ZB Z") 3))))
