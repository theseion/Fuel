accessing
analysisOf: anObject

	^ FLAnalyzer new
		setDebug; 
		analysisFor: anObject
	