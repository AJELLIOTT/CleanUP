(defun c:CleanUP ()

  (command "-purge" "a" "*" "n") 				; Runs PURGE command manually to avoid dialogue boxes.
  (command "zoom" "extents" "-overkill" "all" "" "") 		; Selects all objects in model space and runs OVERKILL command
  (command "audit" "y") 					; Runs AUDIT command and fixes all errors found
  (prompt "\n*** CleanUp Complete! ***\n") 			; Prints message in cmd
	
  (while (= "Y" (strcase(getstring "Would you like to run this again? [Yes/No]<N>: ")nil)) 	; Asks user for input and either runs again, or exits. strcase forces inputs to UPPERCASE
  	 (command "-purge" "a" "*" "n") 							; Cleanup commands
  	 (command "zoom" "extents" "-overkill" "all" "" "") 					; 
  	 (command "audit" "y") 									; 
  	 (prompt "\n*** CleanUp Complete! ***\n") 						; Prints message in cmd when complete
	
  )
  
  (prompt "\nAll done!")	; Message if anything other than "Y" or "y" input
  (princ)			; Quiet exit
)

