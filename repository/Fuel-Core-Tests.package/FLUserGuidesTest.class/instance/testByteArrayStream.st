tests-Getting Started
testByteArrayStream
	| array materializedString |
	array := ByteArray streamContents: [ :stream |
		FLSerializer new
			streamFactory: [ stream ];
			object: 'stringToSerialize';
			serialize ].
	materializedString := FLMaterializer new
		streamFactory: [ array readStream ];
		materializeRoot.
	self assert: materializedString equals: 'stringToSerialize'