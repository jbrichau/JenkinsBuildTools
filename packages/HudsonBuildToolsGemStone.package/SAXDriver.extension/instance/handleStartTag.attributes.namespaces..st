*HudsonBuildToolsGemStone
handleStartTag: anElementName attributes: anAttributeDictionary namespaces: aNamespaceDictionary
	| prefix localName namespaceUri |

	self elementNester startedElement: anElementName.
	(anAttributeDictionary includesKey: 'xml:lang')
		ifTrue: [self languageEnvironment: (anAttributeDictionary at: 'xml:lang')].
	anElementName splitQualifiedNameInto: [:prefixPart :localPart |
		prefix := prefixPart ifNil:[''] ifNotNil:[prefixPart].
		localName := localPart ifNil:[''] ifNotNil:[localPart].
		namespaceUri := ''].

	self usesNamespaces ifTrue: [
		self scopeAllocator enterScope.
		self declareNamespaces: aNamespaceDictionary.
		namespaceUri := self scopeAllocator resolvePrefix: prefix.
		self
			validateStartTag: anElementName
			prefix: prefix
			attributes: anAttributeDictionary].

	self saxHandler 
		startElement: anElementName
		prefix: prefix
		uri: namespaceUri
		localName: localName
		attributes: anAttributeDictionary