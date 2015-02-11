private
beginTestCase: aTestCase runBlock: aBlock
	| time |
		
	time := aBlock timeToRun.
	stream tab; 
		nextPutAll: '<testcase classname="'; 
		nextPutAll: (self encode: (aTestCase class category copyReplaceAll: '-' with: '.')); 
		nextPut: $.; nextPutAll: (self encode: aTestCase class name); 
		nextPutAll: '" name="'; nextPutAll: (self encode: aTestCase selector); 
		nextPutAll: '" time="'; print: (time asMilliSeconds / 1000.0); 
		nextPutAll: '">'; lf
	
