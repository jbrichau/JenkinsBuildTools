private-stack tracing
print: name paddedTo: paddedSize on: outputStream

	outputStream nextPutAll: name.
	name size to: paddedSize do: [ :i | outputStream nextPut: Character space ].
