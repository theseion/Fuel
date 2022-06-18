tests
testMaterializeFrom
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
	materialized := self materializer class materializeFrom: byteArray readStream.
	
	self assert: object equals: materialized