private-stack tracing
printObjectDescription: object on: outputStream

	| objectSize objectClass |

	objectSize := Reflection sizeOf: object.
	objectClass := Reflection classOf: object.

	outputStream nextPutAll: ' ['.
	(Reflection oopOf: object) printOn: outputStream.
	outputStream nextPutAll: ', size: '.
	objectSize printOn: outputStream.
	outputStream nextPutAll: ', class: '.
	(Reflection oopOf: objectClass) printOn: outputStream.
	outputStream
		nextPut: Character space;
		nextPutAll: object class name.
	outputStream
		nextPutAll: '] ';
		nextPutAll: ([ object printStringLimitedTo: 50 ] on: Error do: [ :err | '<error printing object>' ]).
