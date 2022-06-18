tests-running
testMaterializeRoot
	| object materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	self serializer
		object: object;
		serialize.
	
	materialized := self materializer materializeRoot.
	self assert: object equals: materialized