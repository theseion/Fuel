tests-configuring-globals
testFullySerializeBehaviorUsesSet
	self serializer
		fullySerializeBehavior: Object;
		fullySerializeBehavior: Object.
	
	self assert: self serializer behaviorsToSerialize size equals: 1