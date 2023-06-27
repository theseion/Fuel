tests
testMaterializeHeaderFromByteArray
	| object byteArray materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	byteArray := ByteArray streamContents: [ :stream |
		self serializer
			at: #homer putAdditionalObject: 'simpson';
			onStream: stream;
			object: object;
			serialize ].
	materialized := self materializer class materializeHeaderFromByteArray: byteArray.
	
	self assert: materialized class equals: FLHeader.
	self assert: (materialized additionalObjectAt: #homer) equals: 'simpson'