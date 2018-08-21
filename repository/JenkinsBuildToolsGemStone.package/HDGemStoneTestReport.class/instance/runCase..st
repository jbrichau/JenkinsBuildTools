running
runCase: testCase

	GsFile gciLogClient: ('Running test case: {1} ({2})' format: { String streamContents: [ :s | testCase printOn: s ]. DateAndTime now asRFC1123String }).
	super runCase: testCase.
