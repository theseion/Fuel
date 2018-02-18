instance creation
resultsOfHash

	| aSmallIntegerCollection aStringCollection |
	aSmallIntegerCollection := (1 to: (1 << 19)) asOrderedCollection.
	aStringCollection := ((1 to: (1 << 19)) collect: [:x | x printString ]) asOrderedCollection.

	^ 'small integers: ', [ aSmallIntegerCollection do: [:x | x hash ] ] timeToRun printString, 'ms. ',
	'strings: ', [ aStringCollection do: [:x | x hash ] ] timeToRun printString, 'ms.'.
