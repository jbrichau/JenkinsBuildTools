running
setUp
	
	fileStream := NPGsFileWrapper onFile: (ServerFileDirectory default forceNewFileNamed: suite name , '-Test.xml').
	stream := (GRCodec forEncoding: 'utf-8') encoderFor: fileStream.
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; nextPut: Character lf.
	stream nextPutAll: '<testsuite name="'; nextPutAll: (self encode: suite name); nextPutAll: '" tests="'; print: suite tests size; nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	suitePosition := stream position - 1.
	stream nextPutAll: (String new: 100 withAll: $ ); nextPut: Character lf.
	
	"Initialize the test resources."
	suite resources do: [ :each |
		each isAvailable
			ifFalse: [ each signalInitializationError ] ]