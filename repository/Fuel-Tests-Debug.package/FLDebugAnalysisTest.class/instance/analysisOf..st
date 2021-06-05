accessing
analysisOf: anObject
	^ FLCurrentConfiguration
		value: (self serializerConfig
			object: anObject;
			yourself)
		during: [
			FLAnalysis runWith: FLAnalyzer new ]