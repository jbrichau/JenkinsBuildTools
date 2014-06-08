running
runClasses: aCollection named: aName
	"Filter out all the web test cases as they are not supported yet"
	^super runClasses: (aCollection reject: [:cl | cl allSuperclasses includes: BPWebDriverTestCase]) named: aName