tests-Getting Started
testMemoryStream
	| anArray materializedString |
	anArray := ByteArray
		streamContents: [ :stream |
			FLSerializerConfiguration new
				object: 'stringToSerialize';
				streamFactory: [ stream ];
				serialize ].
	materializedString := FLMaterializerConfiguration new
		streamFactory: [ anArray readStream ];
		materialize.
	self assert: materializedString equals: 'stringToSerialize'