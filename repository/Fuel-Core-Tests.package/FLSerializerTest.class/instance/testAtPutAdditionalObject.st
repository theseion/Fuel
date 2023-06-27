tests-configuring-materialization
testAtPutAdditionalObject
	self assert: self serializer additionalObjects isEmpty.
	
	self serializer
		at: #foo putAdditionalObject: Object;
		at: #foo putAdditionalObject: Class.
		
	self assert: self serializer additionalObjects size equals: 1.
	self assert: (self serializer additionalObjects at: #foo) identicalTo: Class