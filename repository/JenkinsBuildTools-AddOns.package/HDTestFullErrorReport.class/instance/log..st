private
log: logString

	FileStream stdout
		nextPutAll: DateAndTime now truncated asString;
		nextPut: Character space;
		nextPutAll: logString;
		nextPutAll: String crlf.
	(FileStream fileNamed: 'Test Running.log') setToEnd;
		nextPutAll: DateAndTime now truncated asString;
		nextPut: Character space;
		nextPutAll: logString;
		nextPut: Character cr;
		close.