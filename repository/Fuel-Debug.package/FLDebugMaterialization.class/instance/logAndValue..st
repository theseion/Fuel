debugging
logAndValue: aBlock
	| result |
	self log: decoder position -> #before -> aBlock method selector.
	result := aBlock value.
	self log: decoder position -> #after -> aBlock method selector.
	^ result
