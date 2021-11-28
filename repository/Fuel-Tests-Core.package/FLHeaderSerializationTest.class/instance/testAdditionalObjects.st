tests
testAdditionalObjects

	self serializer
		at: #test putAdditionalObject: 'test';
		at: 42 putAdditionalObject: 68.
	
	self assertSerializationEqualityOf: 'foo'.

	self assert: (self materializedObjects additionalObjectAt: #test) equals: 'test'.
	self assert: (self materializedObjects additionalObjectAt: 42) equals: 68.