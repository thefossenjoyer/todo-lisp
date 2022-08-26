(defsystem "todo"

 :components ((:module "src"
                :components
                ((:file "todo"))))

  :build-operation "program-op"
  :build-pathname "todo"
  :entry-point "todo::main"
  )
