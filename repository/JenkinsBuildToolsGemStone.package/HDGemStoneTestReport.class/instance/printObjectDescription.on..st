private-stack tracing
printObjectDescription: object on: outputStream

	outputStream nextPutAll: ' ['.
	object asOop printOn: outputStream.
	outputStream nextPutAll: ' size:'.
	object size printOn: outputStream.
	outputStream nextPutAll: ' class: '.
	object class asOop printOn: outputStream.
	outputStream
		nextPut: Character space;
		nextPutAll: object class name.
	outputStream
		nextPutAll: '] ';
		nextPutAll: (object printStringLimitedTo: 50).
