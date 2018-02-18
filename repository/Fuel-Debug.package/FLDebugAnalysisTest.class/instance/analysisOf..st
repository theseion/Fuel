accessing
analysisOf: anObject

	^ FLAnalyzer newDefault 
		setDebug; 
		analysisFor: anObject
	