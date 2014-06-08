private
writeError: error stack: stack
	suiteErrors := suiteErrors + 1.
	stream tab; tab; nextPutAll: '<error type="'; nextPutAll: (self encode: error class name); nextPutAll: '" message="'; nextPutAll: (self encode: (error messageText ifNil: [ error description ])); nextPutAll: '">'; nextPutAll: (self encode: stack); nextPutAll: '</error>'; nextPut: Character lf