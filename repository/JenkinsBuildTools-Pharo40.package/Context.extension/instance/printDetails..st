*JenkinsBuildTools-Pharo40
printDetails: stream
	"Put my class>>selector and instance variables and arguments and temporaries on the stream.  Protect against errors during printing."

	| errorMessage string position |
	self printOn: stream.
	"Compared to the standard implementation (version tag: CamilloBruni 7/17/2013 21:58), the following line was added:"
	stream cr; tab; nextPutAll: 'PC: '; print: pc.
	"---"
	stream cr.
	stream tab; nextPutAll: 'Receiver: '.
	errorMessage := '<<error during printing>>'.
	stream nextPutAll: ([receiver printStringLimitedTo: 90] ifError: [errorMessage]).

	stream cr; tab; nextPutAll: 'Arguments and temporary variables: '; cr.
	string := [(self tempsAndValuesLimitedTo: 80 indent: 2) 
				padRightTo:1 with: $x] ifError: [errorMessage].
	stream nextPutAll: (string allButLast).

	stream cr; tab; nextPutAll: 'Receiver''s instance variables: '; cr.
	position := stream position.
	[receiver longPrintOn: stream limitedTo: 80 indent: 2] ifError: [ 
				stream nextPutAll: errorMessage].
	position = stream position ifTrue: ["normal printString for an Array (it has no inst vars)"
		stream nextPutAll: ([receiver printStringLimitedTo: 90] ifError: [errorMessage])].
	stream peekLast == Character cr ifFalse: [stream cr].