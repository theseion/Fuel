tests
testAvoidRecursion
	| result |
	self serializerConfig when: [ :x | x < 10 ] substituteBy: [ :x | x + 1 ].

	result := self resultOfSerializeAndMaterialize: 1.

	self assert: result equals: 2