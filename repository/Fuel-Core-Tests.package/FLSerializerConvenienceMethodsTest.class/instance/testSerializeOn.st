tests
testSerializeOn
	| object byteArray materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	byteArray := ByteArray streamContents: [ :stream |
		self serializer class
			serialize: object
			on: stream ].
	materialized := self materializer
		onStream: byteArray readStream;
		materializeRoot.
	
	self assert: object equals: materialized