tests
testSimple
	| result |
	self serializer
		when: [ :x | x < 0 ]
		substituteBy: [ :x | 0 ].

	result := self resultOfSerializeAndMaterialize: -1.

	self assert: result equals: 0