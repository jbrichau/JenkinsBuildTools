testing
isClassEnvironment: anEnvironment
	^ #(RBCategoryEnvironment RBClassEnvironment RBVariableEnvironment) includes: anEnvironment class name