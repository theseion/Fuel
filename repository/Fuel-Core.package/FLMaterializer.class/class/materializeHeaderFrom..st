convenience
materializeHeaderFrom: aStream
	^ self new
		onStream: aStream;
		materializeHeader