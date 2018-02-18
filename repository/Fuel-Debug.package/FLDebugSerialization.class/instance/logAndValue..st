debugging
logAndValue: aBlock
	| result |
	self log: encoder position -> #before -> aBlock method selector.
	result := aBlock value.
	self log: encoder position -> #after -> aBlock method selector.
	^ result
