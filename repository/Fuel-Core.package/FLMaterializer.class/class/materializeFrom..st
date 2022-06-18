convenience
materializeFrom: aStream
	^ self new
		onStream: aStream;
		materializeRoot