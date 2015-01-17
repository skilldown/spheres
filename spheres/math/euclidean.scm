;;!!! Euclidean space matrix operations
;; .author Alvaro Castro-Castilla, 2013-2015

(define (make-identity-matrix4x4)
  '#(#(1 0 0 0)
     #(0 1 0 0)
     #(0 0 1 0)
     #(0 0 0 1)))

(define (make-translation-matrix x y z)
  `#(#(1 0 0 ,x)
     #(0 1 0 ,y)
     #(0 0 1 ,z)
     #(0 0 0 1)))

(define (make-scaling-matrix x y z)
  `#(#(,x 0 0 0)
     #(0 ,y 0 0)
     #(0 0 ,z 0)
     #(0 0 0 1)))

(define (make-x-rotation-matrix omega)
  (let ((cosO (cos omega))
        (sinO (sin omega)))
    (let ((-sinO (- sinO)))
      `#(#(1 0     0      0)
         #(0 ,cosO ,-sinO 0)
         #(0 ,sinO ,cosO  0)
         #(0 0     0      1)))))

(define (make-y-rotation-matrix omega)
  (let ((cosO (cos omega))
        (sinO (sin omega)))
    (let ((-sinO (- sinO)))
      `#(#(,cosO  0 ,sinO 0)
         #(0      1 0     0)
         #(,-sinO 0 ,cosO 0)
         #(0      0 0     1)))))

(define (make-z-rotation-matrix omega)
  (let ((cosO (cos omega))
        (sinO (sin omega)))
    (let ((-sinO (- sinO)))
      `#(#(,cosO ,-sinO 0 0)
         #(,sinO ,cosO  0 0)
         #(0     0      1 0)
         #(0     0      0 1)))))

(define (make-rotation-matrix x y z omega)
  (let ((C (cos omega))
        (S (sin omega)))
    (let ((iC (- 1 C))
          (iS (- 1 S)))
      `#(#(,(let ((x2 (* x x))) (+ x2
                                   (* (- 1 x2)
                                      C)))
           ,(- (* iC x y)
               (* z S))
           ,(+ (* iC x z)
               (* y S))
           0)
         #(,(+ (* iC x y)
               (* z S))
           ,(let ((y2 (* y y))) (+ y2
                                   (* (- 1 y2)
                                      C)))
           ,(- (* iC y z)
               (* x S))
           0)
         #(,(- (* iC x z)
               (* y S))
           ,(+ (* iC y z)
               (* x S))
           ,(let ((z2 (* z z))) (+ z2
                                   (* (- 1 z2)
                                      C)))
           0)
         #(0
           0
           0
           1)))))
