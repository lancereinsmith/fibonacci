;;;; Enhanced Fibonacci Sequence Generator in Common Lisp

;;; ANSI color codes
(defparameter *reset* "~C[0m" "ANSI reset code")
(defparameter *green* "~C[32m" "ANSI green code")
(defparameter *yellow* "~C[33m" "ANSI yellow code")
(defparameter *cyan* "~C[36m" "ANSI cyan code")
(defparameter *magenta* "~C[35m" "ANSI magenta code")
(defparameter *red* "~C[31m" "ANSI red code")
(defparameter *gray* "~C[90m" "ANSI gray code")

(defun print-color (color-code text)
  "Print text with ANSI color code"
  (format t color-code #\Esc)
  (format t "~A" text)
  (format t *reset* #\Esc))

(defun clear-screen ()
  "Clear the terminal screen"
  #+unix (format t "~C[H~C[2J" #\Esc #\Esc)
  #+win32 (run-program "cmd" '("/c" "cls") :output t)
  #-(or unix win32) (format t "~%~%"))

(defun display-header ()
  "Display the program header"
  (print-color *green* "===============================================")
  (terpri)
  (print-color *green* "      Enhanced Fibonacci Sequence Generator    ")
  (terpri)
  (print-color *green* "===============================================")
  (terpri)
  (terpri))

(defun display-menu ()
  "Display menu options"
  (print-color *yellow* "Generation Options:")
  (terpri)
  (format t "  1. Generate by number of terms~%")
  (format t "  2. Generate up to a maximum value~%")
  (format t "  3. Display with statistics~%")
  (format t "  4. Display in columns~%")
  (terpri)
  (format t "Enter your choice (1-4): "))

(defun generate-fibonacci (term-count show-stats column-mode)
  "Generate and display Fibonacci sequence"
  (let ((t1 0)
        (t2 1)
        (sum 0)
        (terms-per-line 10))
    
    (if column-mode
        (progn
          (print-color *cyan* (format nil "Fibonacci Sequence (~D terms):" term-count))
          (terpri)
          (terpri))
        (progn
          (print-color *cyan* "Fibonacci Sequence:")
          (terpri)))
    
    ;; Handle the first term
    (when (>= term-count 1)
      (if column-mode
          (format t "~12D" t1)
          (format t "~D " t1))
      (incf sum t1))
    
    ;; Handle the second term
    (when (>= term-count 2)
      (if column-mode
          (format t "~12D" t2)
          (format t "~D " t2))
      (incf sum t2))
    
    ;; Calculate and print remaining terms
    (loop for j from 3 to term-count
          for next-term = (+ t1 t2)
          do (if column-mode
                 (progn
                   (format t "~12D" next-term)
                   (when (zerop (mod j terms-per-line))
                     (terpri)))
                 (format t "~D " next-term))
             (incf sum next-term)
             (setf t1 t2
                   t2 next-term))
    
    (terpri)
    (terpri)
    
    ;; Display statistics if requested
    (when show-stats
      (print-color *magenta* "Statistics:")
      (terpri)
      (format t "  Number of terms: ~D~%" term-count)
      (format t "  Sum of all terms: ~D~%" sum)
      (format t "  Average value: ~,2F~%" (/ (float sum) term-count))
      (when (>= term-count 2)
        (format t "  Last term: ~D~%" t2)
        (format t "  Second-to-last term: ~D~%" t1)
        (when (/= t1 0)
          (let* ((ratio (/ (float t2) t1))
                 (golden-ratio 1.6180339887)
                 (difference (abs (- ratio golden-ratio))))
            (format t "  Ratio (F(n)/F(n-1)): ~,10F~%" ratio)
            (format t "  Golden Ratio (φ): ~,10F~%" golden-ratio)
            (format t "  Difference: ~,10F~%" difference))))
      (terpri))))

(defun generate-up-to-max (max-val)
  "Generate Fibonacci sequence up to a maximum value"
  (let ((t1 0)
        (t2 1)
        (count 0))
    
    (print-color *cyan* (format nil "Fibonacci Sequence up to ~D:" max-val))
    (terpri)
    (terpri)
    
    (when (>= max-val 0)
      (format t "~D " t1)
      (incf count))
    
    (when (>= max-val 1)
      (format t "~D " t2)
      (incf count))
    
    (loop while (<= (+ t1 t2) max-val)
          for next-term = (+ t1 t2)
          do (format t "~D " next-term)
             (incf count)
             (setf t1 t2
                   t2 next-term))
    
    (terpri)
    (terpri)
    (print-color *magenta* (format nil "Total terms generated: ~D" count))
    (terpri)
    (terpri)))

(defun read-integer ()
  "Read an integer from standard input with error handling"
  (let ((input (read-line)))
    (handler-case
        (parse-integer input)
      (error () nil))))

(defun main ()
  "Main program entry point"
  (clear-screen)
  (display-header)
  (display-menu)
  (finish-output)
  
  (let ((choice (read-integer)))
    (terpri)
    
    (case choice
      (1 (format t "Enter the number of terms to generate (max 92): ")
         (finish-output)
         (let ((n (read-integer)))
           (terpri)
           (cond
             ((<= n 0)
              (print-color *red* "Error: Please enter a positive integer.")
              (terpri))
             ((> n 92)
              (print-color *red* "Error: Maximum 92 terms supported with 64-bit integers.")
              (terpri)
              (print-color *red* "Using 92 terms instead.")
              (terpri)
              (terpri)
              (generate-fibonacci 92 nil nil))
             (t
              (generate-fibonacci n nil nil)))))
      
      (2 (format t "Enter the maximum value: ")
         (finish-output)
         (let ((max-val (read-integer)))
           (terpri)
           (if (< max-val 0)
               (progn
                 (print-color *red* "Error: Please enter a non-negative value.")
                 (terpri))
               (generate-up-to-max max-val))))
      
      (3 (format t "Enter the number of terms to generate (max 92): ")
         (finish-output)
         (let ((n (read-integer)))
           (terpri)
           (cond
             ((<= n 0)
              (print-color *red* "Error: Please enter a positive integer.")
              (terpri))
             ((> n 92)
              (print-color *red* "Error: Maximum 92 terms supported with 64-bit integers.")
              (terpri)
              (print-color *red* "Using 92 terms instead.")
              (terpri)
              (terpri)
              (generate-fibonacci 92 t nil))
             (t
              (generate-fibonacci n t nil)))))
      
      (4 (format t "Enter the number of terms to generate (max 92): ")
         (finish-output)
         (let ((n (read-integer)))
           (terpri)
           (cond
             ((<= n 0)
              (print-color *red* "Error: Please enter a positive integer.")
              (terpri))
             ((> n 92)
              (print-color *red* "Error: Maximum 92 terms supported with 64-bit integers.")
              (terpri)
              (print-color *red* "Using 92 terms instead.")
              (terpri)
              (terpri)
              (generate-fibonacci 92 nil t))
             (t
              (generate-fibonacci n nil t)))))
      
      (otherwise
       (print-color *red* "Invalid choice. Using default mode (option 1).")
       (terpri)
       (terpri)
       (format t "Enter the number of terms to generate (max 92): ")
       (finish-output)
       (let ((n (read-integer)))
         (terpri)
         (when (and n (> n 0))
           (when (> n 92) (setf n 92))
           (generate-fibonacci n nil nil)))))
    
    (terpri)
    (print-color *gray* "Press ENTER to exit...")
    (read-line)))

;; Run the main program
(main)

