tests-configuring-stream
testStreamFinalizer
	| contents |
	serializer := FLSerializer new
		streamFinalizer: [ :stream | contents := stream contents ]
		yourself.
	
	contents := self serializer streamFinalizer value: 'foo' readStream.
	self assert: contents equals: 'foo'