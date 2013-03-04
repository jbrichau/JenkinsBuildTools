*HudsonBuildToolsGemStone
validatePrefixedAttributeName: anAttributeName in: aDictionary
	anAttributeName splitQualifiedNameInto: [:prefix :localName |
		(prefix isNil or: [prefix isEmpty]) ifTrue: [^ self].

		self
			validatePrefix: prefix
			ofAttributeName: anAttributeName.
		self
			ensureAttributePrefix: prefix
			localName: localName
			hasNoAliasIn: aDictionary]