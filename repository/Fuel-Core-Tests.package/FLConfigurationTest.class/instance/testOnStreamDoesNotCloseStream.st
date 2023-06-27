tests-configuring-convenience
testOnStreamDoesNotCloseStream
	| stream |
	stream := FLFilePoolTestResource current writeStreamForFilePath: 'test'.
	self serializer
		onStream: stream;
		object: 'abc';
		serialize.
	
	self deny: stream closed.
	
	stream close.
	self assert: stream closed