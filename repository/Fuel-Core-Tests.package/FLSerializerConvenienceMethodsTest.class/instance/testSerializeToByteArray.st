tests
testSerializeToByteArray
	| object byteArray materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	byteArray := self serializer class serializeToByteArray: object.
	materialized := self materializer
		onStream: byteArray readStream;
		materializeRoot.
	
	self assert: object equals: materialized