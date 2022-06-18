tests-running
testMaterialize
	| object materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	self serializer
		at: #homer putAdditionalObject: 'simpson';
		object: object;
		serialize.
	
	materialized := self materializer materialize.
	self assert: FLMaterializedObjects equals: materialized class.
	self assert: 'simpson' equals: (materialized header additionalObjectAt: #homer).
	self assert: object equals: materialized root.
	self assert: 1 equals: materialized roots size