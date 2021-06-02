tests-Getting Started
testFileStream
	| materializedString |
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo:
			[ :aStream | FLSerializer new serialize: 'stringToSerialize' on: aStream ].
	materializedString := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [ :aStream | 
			(FLMaterializer new
				materializeFrom: aStream) root ].
	self assert: materializedString equals: 'stringToSerialize'