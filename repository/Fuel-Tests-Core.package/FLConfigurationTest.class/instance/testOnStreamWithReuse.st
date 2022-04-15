tests-configuring-convenience
testOnStreamWithReuse
	| stream1 stream2 materialized |
	stream1 := (ByteArray new: 5) writeStream.
	stream2 := (ByteArray new: 5) writeStream.
	self serializer
		onStream: stream1;
		object: 'abc';
		serialize.
		
	self serializer
		onStream: stream2;
		object: 'efg';
		serialize.
	
	self deny: stream1 isEmpty.
	self deny: stream2 isEmpty.
	
	materialized := self materializer
		onStream: stream1 contents readStream;
		materializeRoot.
	self assert: materialized equals: 'abc'.
	
	materialized := self materializer
		onStream: stream2 contents readStream;
		materializeRoot.
	self assert: materialized equals: 'efg'