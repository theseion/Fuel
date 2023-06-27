tests-configuring-globals
testFullySerializeBehavior
	self serializer fullySerializeBehavior: Object.
	
	self assert: self serializer behaviorsToSerialize size equals: 1.
	self assert: self serializer behaviorsToSerialize anyOne identicalTo: Object