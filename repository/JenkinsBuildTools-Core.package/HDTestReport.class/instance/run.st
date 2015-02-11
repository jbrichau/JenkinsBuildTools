running
run
	Author uniqueInstance
		ifUnknownAuthorUse: 'hudson'
		during: [ [ 
			self setUp.
			suiteTime := self millisecondsToRunBlock: [ self runAll ] ]
					ensure: [ self tearDown ] ]