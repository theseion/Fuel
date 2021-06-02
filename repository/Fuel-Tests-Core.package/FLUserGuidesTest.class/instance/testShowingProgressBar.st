tests-Getting Started
testShowingProgressBar
	(self environmentOfTest includesKey: #FLProgressSerialization)
		ifFalse: [
			" Needs: FuelProgressUpdate package"
			^ self skip ].
	
	FLPlatform current
		fileNamed: 'numbers.fuel'
		writeStreamDo: [ :aStream | 
			FLSerializer new 
				showProgress;
				serialize: (1 to: 200000) asArray on: aStream ].
	FLPlatform current
		fileNamed: 'numbers.fuel'
		readStreamDo: [ :aStream | 
			FLMaterializer new
				showProgress;
				materializeFrom: aStream ]