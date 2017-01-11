running
runCase: aTestCase

	self log: 'Running ' , aTestCase asString.
	super runCase: aTestCase.
	self log: 'Finished running ' , aTestCase asString.
