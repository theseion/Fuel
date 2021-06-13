tests
testLowercaseSomeSymbols
	| result |
	self serializer
		when: [ :x | #A = x ] substituteBy: [ :x | #a ];
		when: [ :x | #B = x ] substituteBy: [ :x | #b ].

	result := self resultOfSerializeAndMaterialize: #(A B C).

	self assert: #(a b C) equals: result