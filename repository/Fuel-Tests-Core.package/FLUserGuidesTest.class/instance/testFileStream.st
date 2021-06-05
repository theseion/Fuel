tests-Getting Started
testFileStream
	| array materializedString |
	array := ByteArray streamContents: [ :stream |
		FLSerializerConfiguration new
			streamFactory: [ stream ];
			object: 'stringToSerialize';
			serialize ].
	materializedString := FLMaterializerConfiguration new
		streamFactory: [ array readStream ];
		materialize.
	self assert: materializedString equals: 'stringToSerialize'