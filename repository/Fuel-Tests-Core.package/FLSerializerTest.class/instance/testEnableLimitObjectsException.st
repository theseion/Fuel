tests-configuring
testEnableLimitObjectsException
	self deny: self serializer isLimitObjectsExceptionEnabled.
	
	self serializer enableLimitObjectsException.
	self assert: self serializer isLimitObjectsExceptionEnabled