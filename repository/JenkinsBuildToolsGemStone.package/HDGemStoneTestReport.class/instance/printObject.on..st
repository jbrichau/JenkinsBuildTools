private-stack tracing
printObject: object on: outputStream

	| objectSize objectClass instanceVariables numberOfInstanceVariables |

	objectSize := Reflection sizeOf: object.
	objectClass := Reflection classOf: object.
	(objectClass isKindOf: CharacterCollection) ifTrue: [ ^ self ].
	
	instanceVariables := objectClass allInstVarNames.
	numberOfInstanceVariables := instanceVariables size.
	1 to: objectSize do: [ :objectIndex |
		| variableName objectVariableValue |
		variableName := (objectIndex <= numberOfInstanceVariables)
			ifTrue: [ instanceVariables at: objectIndex ]
			ifFalse: [ (objectIndex - numberOfInstanceVariables) asString ].
		objectVariableValue := Reflection fetchFrom: object at: objectIndex.
		outputStream nextPutAll: '     '.
		self printVariable: variableName paddedTo: 15 withValue: objectVariableValue on: outputStream.
		outputStream lf ].
