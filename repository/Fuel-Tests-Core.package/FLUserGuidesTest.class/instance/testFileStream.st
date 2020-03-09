tests-Getting Started
testFileStream
	| materializedString |
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo:
			[ :aStream | FLSerializer newDefault serialize: 'stringToSerialize' on: aStream ].
	materializedString := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [ :aStream | 
			(FLMaterializer newDefault
				materializeFrom: aStream) root ].
	self assert: materializedString equals: 'stringToSerialize'