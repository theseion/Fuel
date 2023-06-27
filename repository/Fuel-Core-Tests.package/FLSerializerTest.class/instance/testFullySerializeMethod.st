tests-configuring-globals
testFullySerializeMethod
	self serializer fullySerializeMethod: Object>>#=.
	
	self assert: self serializer methodsToSerialize size equals: 1.
	self assert: self serializer methodsToSerialize anyOne identicalTo: Object>>#=