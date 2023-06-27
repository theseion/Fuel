tests-configuring-globals
testFullySerializeAllBehaviors
	| behaviors |
	behaviors := { Object. Object. Array. self classFactory silentlyNewTrait }.
	self serializer fullySerializeAllBehaviors: behaviors.
	
	self assert: self serializer behaviorsToSerialize size equals: 3.
	self assertCollection: self serializer behaviorsToSerialize  hasSameElements: behaviors asSet