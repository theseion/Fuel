tests-Customizing Graph
testPluggableSubstitution
	| objectToSerialize aSerializer materializedObject |
	objectToSerialize := Array with: 'hello' with: '' writeStream.
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo: [ :aStream | 
			aSerializer := FLSerializer new.
			aSerializer analyzer
				when: [ :o | o isStream ]
				substituteBy: [ :o | nil ].
			aSerializer serialize: objectToSerialize on: aStream ].
	materializedObject := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo:
			[ :aStream | (FLMaterializer new materializeFrom: aStream) root ].
	self
		assert: materializedObject
		equals: (Array with: 'hello' with: nil)