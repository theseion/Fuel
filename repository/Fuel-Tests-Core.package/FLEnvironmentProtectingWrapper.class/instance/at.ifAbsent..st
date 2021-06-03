accessing
at: key ifAbsent: aBlock
	| value |
	value := overlay
		at: key
		ifAbsent: [
			environment
				at: key
				ifAbsent: aBlock ].
	^ value == sentinel
		ifTrue: aBlock
		ifFalse: [ value ]