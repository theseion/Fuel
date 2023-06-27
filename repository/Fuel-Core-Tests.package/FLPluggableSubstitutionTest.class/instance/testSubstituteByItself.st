tests
testSubstituteByItself
	| result |
	self serializer
		when: [ :x | true ]
		substituteBy: [ :x | x ].

	result := self resultOfSerializeAndMaterialize: 1.

	self assert: result equals: 1