private
stackTraceString: err of: aTestCase

	| process |

	process := GsProcess continuationFromLevel: 1.
	^ String streamContents: [ :stringStream |
		| level |
		level := 1.
		[ self printFrameContentsOf: process at: level on: stringStream ]
			whileTrue: [ level := level + 1 ] ]