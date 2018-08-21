running
runCase: testCase

	GsFile gciLogClient: ('Running test case: {1} ({2})' format: { testCase asString. DateAndTime now asRFC1123String }).
	super runCase: testCase.
