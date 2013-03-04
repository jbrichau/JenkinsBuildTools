private
log: logString

	Smalltalk at: #OSProcess ifPresent: [ :osprocess |
		osprocess thisOSProcess stdOut
			nextPutAll: DateAndTime now asString;
			nextPut: Character space;
			nextPutAll: logString;
			nextPutAll: String crlf.
	].
	(FileStream fileNamed: 'Test Running.log') setToEnd;
		nextPutAll: DateAndTime now asString;
		nextPut: Character space;
		nextPutAll: logString;
		nextPut: Character cr;
		close.