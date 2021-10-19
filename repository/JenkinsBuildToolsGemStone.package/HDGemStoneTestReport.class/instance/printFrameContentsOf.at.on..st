private-stack tracing
printFrameContentsOf: process at: level on: outputStream

	| indentationString nameWidth receiverName frameContents method receiver argAndTempNames |

	indentationString := '   '.
	nameWidth := 15.
	receiverName := 'receiver'.
	frameContents := (process _frameContentsAt: level) ifNil: [ ^ false ].
	method := frameContents at: 1.
	(method notNil and: [ (method selector = #runAll) and: [ method inClass = HDTestReport ] ]) ifTrue: [ ^ false ].
	receiver := frameContents at: 10.
	argAndTempNames := frameContents at: 9.
	GRPlatform current isGemStone3
		ifTrue:[
			outputStream
				nextPutAll: (process _reportWithFrameContents: frameContents level: level);
				nextPut: Character space;
				nextPutAll: (process _stepPointStringAt: level);
				lf ]
		ifFalse:[
			outputStream
				nextPutAll: (GsProcess _reportWithFrameContents: frameContents);
				nextPut: Character space;
				nextPutAll: (process _localStepPointStringAt: level);
				lf ].
	outputStream nextPutAll: indentationString.
	self printVariable: receiverName paddedTo: nameWidth withValue: receiver on: outputStream.
	outputStream lf.
	self printObject: receiver on: outputStream.
	outputStream lf.
	argAndTempNames keysAndValuesDo: [ :variableIndex :variableName |
		| variableValue |
		variableValue := frameContents at: 10 + variableIndex.
		outputStream nextPutAll: indentationString.
		self printVariable: variableName paddedTo: nameWidth withValue: variableValue on: outputStream.
		outputStream lf.
		self printObject: variableValue on: outputStream.
		outputStream lf ].
	outputStream lf.
	^ true