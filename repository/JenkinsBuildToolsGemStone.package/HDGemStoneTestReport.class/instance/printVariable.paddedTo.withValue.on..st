private-stack tracing
printVariable: variableName paddedTo: nameWidth withValue: variableValue on: outputStream

	self print: variableName paddedTo: nameWidth on: outputStream.
	self printObjectDescription: variableValue on: outputStream.
