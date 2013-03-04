private
writeFailure: error stack: stack
	suiteFailures := suiteFailures + 1.
	stream tab; tab; nextPutAll: '<failure type="'; nextPutAll: (self encode: error class name); nextPutAll: '" message="'; nextPutAll: (self encode: (error messageText ifNil: [ error description ])); nextPutAll: '">'; nextPutAll: (self encode: stack); nextPutAll: '</failure>'; nextPut: Character lf