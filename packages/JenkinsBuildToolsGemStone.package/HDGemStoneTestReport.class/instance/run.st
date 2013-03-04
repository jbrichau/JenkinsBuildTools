running
run
	MCPlatformSupport 
		commitOnAlmostOutOfMemoryDuring:[
			[self setUp.
				suiteTime := [ self runAll ]
				timeToRun ] ensure: [ self tearDown ] ]