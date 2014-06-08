private
writeFailure: error stack: stack

	super writeFailure: error stack: stack.
	self log: ' [FAILURE]'.