private
beginTestCase: aTestCase time: time
	stream tab; nextPutAll: '<testcase classname="'; nextPutAll: (self encode: (aTestCase class category copyReplaceAll: '-' with: '.')); nextPut: $.; nextPutAll: (self encode: aTestCase class name); nextPutAll: '" name="'; nextPutAll: (self encode: aTestCase selector); nextPutAll: '" time="'; nextPutAll: (time / 1000.0) printNextPlanNumber; nextPutAll: '">'; nextPut: Character lf
