private
endTestCase

	super endTestCase.
	
	"Commit the state to free up memory"
	System commitTransaction