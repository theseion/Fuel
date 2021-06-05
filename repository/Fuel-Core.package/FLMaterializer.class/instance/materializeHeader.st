materializing
materializeHeader
	^ self configuration streamDo: [ :stream |
		| aDecoder |
		aDecoder := FLDecoder 
			on: stream 
			migrations: self configuration migrations 
			globalEnvironment: self configuration environment.
		self verifySignatureFrom: aDecoder.
		self verifyVersionFrom: aDecoder.
		self decodeHeaderWith: aDecoder ]