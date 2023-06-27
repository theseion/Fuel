tests-running
testMaterializeHeader
	| object materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	self serializer
		at: #homer putAdditionalObject: 'simpson';
		object: object;
		serialize.
	
	materialized := self materializer materializeHeader.
	self assert: 'simpson' equals: (materialized additionalObjectAt: #homer)