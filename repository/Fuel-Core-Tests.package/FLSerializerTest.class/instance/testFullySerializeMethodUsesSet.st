tests-configuring-globals
testFullySerializeMethodUsesSet
	self serializer
		fullySerializeMethod: Object>>#=;
		fullySerializeMethod: Object>>#=.
	
	self assert: self serializer methodsToSerialize size equals: 1