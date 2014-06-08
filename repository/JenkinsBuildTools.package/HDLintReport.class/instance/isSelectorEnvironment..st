testing
isSelectorEnvironment: anEnvironment
	^ #(RBSelectorEnvironment RBParseTreeEnvironment RBVariableEnvironment) includes: anEnvironment class name