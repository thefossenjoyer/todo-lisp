(defpackage #:todo
  (:use :cl))

(in-package #:todo)

(defun write-todo () "Writes todo to a file."

  (format t ": ~&")
  ;; (defvar user-input)

  ;; (setf user-input (make-array '(0) :element-type 'base-char :adjustable t))
  ;; (setf user-input (read-line))

  (let ((user-input (read)))
    (with-open-file (stream "./file.txt" :direction :output :if-exists :append :if-does-not-exist :create)

      (format stream "~a~%" (string-downcase user-input))

      )

    )


)

(defun read-todo () "Lists all todos."

  (defvar index 0)

  (with-open-file (stream "./file.txt")

    (let((index 0))

      (loop for line = (read stream nil)

            while line do
              (setf index (+ 1 index))
              (format t "Todo ~a -> ~a~%" index line)

            ) ;; nil so it doesn't error out when EOF
      )


    )

)

(defun see-todo () "Checks if todo is already added."

  ;; (defvar test-todo "")

  (with-open-file (stream "./file.txt" :if-does-not-exist nil)

    (format t ": ~&")
    (let ((test-todo (read-line)))

        (loop for line = (read stream nil)

              while line do
                (if (string-equal line test-todo) (format t "Already added. ~&"))

              )
      )


    )

  )

(defun menu () "Prompt for the user."

  (format t "1. Add todo~&2. List todos~&3. Check if a todo has already been added (takes one arg, todo)~&~&")

  (format t ": ~&")
  (defvar user-choice (make-array '(0) :element-type 'base-char))
  (setf user-choice (read-line))

  (cond

    ((= 1 (parse-integer user-choice)) (write-todo))

    ((= 2 (parse-integer user-choice)) (read-todo))

    ((= 3 (parse-integer user-choice)) (see-todo))

    )

  )

(defun main () "Runs the programme."

  (menu)

  )
