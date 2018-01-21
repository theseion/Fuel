*FuelBenchmarks
millisecondsToRunWithoutContextSwitch: timedBlock 
	"Answer the number of milliseconds timedBlock takes to return its value."

	| initialMilliseconds |
	initialMilliseconds := self millisecondClockValue.
	timedBlock valueNoContextSwitch.
	^self millisecondsSince: initialMilliseconds