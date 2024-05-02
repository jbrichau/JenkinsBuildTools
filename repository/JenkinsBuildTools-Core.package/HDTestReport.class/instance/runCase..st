running
runCase: aTestCase
	| error time stack |
	time := self millisecondsToRunBlock: [ [ aTestCase runCase ] 
		on: self exceptionSet
		do: [ :err |
			error ifNil: [
				error := err.
				stack := self stackTraceString: err of: aTestCase
			] ifNotNil: [
				stack := String streamContents: [ :stringStream |
					stringStream
						nextPutAll: '=== Setup/test exception stack trace:'; lf;
						nextPutAll: stack; lf; lf;
						nextPutAll: '=== Teardown exception stack trace:'; lf;
						nextPutAll: (self stackTraceString: err of: aTestCase) ] ] ] ].
	self beginTestCase: aTestCase time: time.
	(error isNil or: [ aTestCase expectedFailures includes: aTestCase selector ]) ifFalse: [
		(error isKindOf: TestFailure)
			ifTrue: [ self writeError: error stack: stack ]
			ifFalse: [ self writeError: error stack: stack ] ].
	self endTestCase