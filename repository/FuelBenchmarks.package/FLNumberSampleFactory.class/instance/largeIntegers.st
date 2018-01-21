samples
largeIntegers

	^ self positiveLargeIntegers 
		collectWithIndex: [:each :index | 
			index even 
				ifTrue: [ each negated ]
				ifFalse: [ each ] ]