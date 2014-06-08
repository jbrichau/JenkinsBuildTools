generating
generateSourceFile: aPackage on: aStream
	| items |
	aStream tab: 4; nextPutAll: '<srcfile name="'; nextPutAll: (self encode: (aPackage packageName copyReplaceAll: '-' with: '.')); nextPutAll: '.mcz">'; nextPut: Character lf.
	self
		generateType: 'class' indent: 5
		total: (items := aPackage classes asSet) size
		actual: ((covered collect: [ :each | each actualClass theNonMetaClass ]) asSet
			count: [ :each | items includes: each ])
		on: aStream.
	#('method' 'block' 'line') do: [ :type |
		self
			generateType: 'method' indent: 5
			total: (items := aPackage methods asSet) size
			actual: (covered count: [ :each | items includes: each ])
			on: aStream.
	].
	aPackage classes 
		do: [ :class | self generatePackage: aPackage class: class on: aStream ].
	aStream tab: 4; nextPutAll: '</srcfile>'; nextPut: Character lf