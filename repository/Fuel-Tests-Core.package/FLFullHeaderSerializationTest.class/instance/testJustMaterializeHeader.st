tests
testJustMaterializeHeader
	| header |
	self serializer
		at: #test putAdditionalObject: 'test';
		at: 42 putAdditionalObject: 68.
	
	self serialize: 'foo'.
	
	header := self materializer materializeHeader.
	self assert: (header additionalObjectAt: #test) equals: 'test'.
	self assert: (header additionalObjectAt: 42) equals: 68