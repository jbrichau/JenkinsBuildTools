private
millisecondsToRunBlock: aBlock

	"Platform-agnostic calculation (instead of using #timeToRun)"
	^Time millisecondsToRun: aBlock