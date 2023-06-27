tests
testMaterializeFromByteArray
	| object byteArray materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	byteArray := ByteArray streamContents: [ :stream |
		self serializer
			onStream: stream;
			object: object;
			serialize ].
	materialized := self materializer class materializeFromByteArray: byteArray.
	
	self assert: object equals: materialized