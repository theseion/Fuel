tests-running
testMaterializeObjectCollection
	| object1 object2 materialized |
	object1 := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	object2 := FLPair new
		left: 'c';
		yourself.
	self serializer
		at: #homer putAdditionalObject: 'simpson';
		objectCollection: {object1. object2};
		serialize.
	
	materialized := self materializer materializeObjectCollection.
	self assert: FLMaterializedObjects equals: materialized class.
	self assert: 'simpson' equals: (materialized header additionalObjectAt: #homer).
	self assert: object2 equals: materialized root.
	self assert: 2 equals: materialized roots size.
	self assert: object1 equals: materialized roots first.
	self assert: object2 equals: materialized roots second