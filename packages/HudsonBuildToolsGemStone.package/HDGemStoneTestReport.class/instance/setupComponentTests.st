private
setupComponentTests
	"Enable all the infrastructure for component tests if the suite includes at least one such test"
	(suite tests anySatisfy:[:test | test class allSuperclasses includes: STTestCase])
		ifTrue:[
			"Create an adaptor if it does not exist"
			(WAAdmin serverAdaptors anySatisfy:[:e | e isKindOf: WAGsSwazooAdaptor])
				ifFalse:[WAGsSwazooAdaptor port:8383].
	
			"Start the swazoo adaptor"
			WAGemStoneRunSeasideGems default
			name: 'Swazoo';
			adaptorClass: WAGsSwazooAdaptor;
			ports: #(8383).
			WAGemStoneRunSeasideGems restartGems]