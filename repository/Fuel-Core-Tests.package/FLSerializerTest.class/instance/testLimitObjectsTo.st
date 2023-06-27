tests-configuring
testLimitObjectsTo
	self deny: self serializer hasObjectsLimit.

	self serializer limitObjectsTo: -4.
	self deny: self serializer hasObjectsLimit.
	
	self serializer limitObjectsTo: 0.
	self deny: self serializer hasObjectsLimit.
	
	self serializer limitObjectsTo: 1.
	self assert: self serializer hasObjectsLimit