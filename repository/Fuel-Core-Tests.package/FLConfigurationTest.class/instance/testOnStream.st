tests-configuring-convenience
testOnStream
	| stream materialized |
	stream := (ByteArray new: 100) writeStream.
	self serializer
		onStream: stream;
		object: 'abc';
		serialize.
	
	self deny: stream isEmpty.
	
	materialized := self materializer
		onStream: stream contents readStream;
		materializeRoot.
	self assert: materialized equals: 'abc'