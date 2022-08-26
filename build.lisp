(pushnew (uiop::getcwd) ql:*local-project-directories*)
(ql:quickload :todo)
(asdf:make :todo)
