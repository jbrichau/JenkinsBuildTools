*JenkinsBuildTools
printDetails: strm
	"Put my class>>selector and arguments and temporaries on the stream.  Protect against errors during printing."

	| str |
	self printOn: strm.  

	"Compared to the standard implementation (version tag: HenrikSperreJohansen 6/28/2010 12:20), the following line was added:"
	strm cr; tab; nextPutAll: 'PC: '; print: pc.
	"---"
	strm cr; tab; nextPutAll: 'Arguments and temporary variables: '; cr.
	str := [self tempsAndValuesLimitedTo: 80 indent: 2] ifError: [
						'<<error during printing>>'].
	strm nextPutAll: str.
	strm peekLast == Character cr ifFalse: [strm cr].