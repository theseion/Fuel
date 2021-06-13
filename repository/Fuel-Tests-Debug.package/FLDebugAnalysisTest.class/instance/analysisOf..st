accessing
analysisOf: anObject
	^ self serializer
		object: anObject;
		useDuring:[ FLAnalysis run ]