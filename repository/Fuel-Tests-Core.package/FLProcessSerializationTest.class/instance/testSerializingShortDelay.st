tests
testSerializingShortDelay
	| process |
	process := [ 2 timesRepeat: [ | d |
		d := Delay forMilliseconds: 50.
		d wait ] ] forkAt: Processor userBackgroundPriority.
	
	self 
		shouldnt: [ self serialize: process ]
		raise: FLObjectNotFound.
		
	self assert: (self serializer at: #delayedMockUsed)