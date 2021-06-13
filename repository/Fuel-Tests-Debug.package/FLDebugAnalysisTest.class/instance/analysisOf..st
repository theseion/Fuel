accessing
analysisOf: anObject
	^ self serializerConfig
		object: anObject;
		useDuring:[ FLAnalysis run ]