convenience
serialize: anObject on: aStream
	self new
		object: anObject;
		onStream: aStream;
		serialize