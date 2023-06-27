tests-configuring-globals
testFullySerializeAllMethods
	| methods |
	methods := { Object>>#=. Object>>#=. Object>>#at: }.
	self serializer fullySerializeAllMethods: methods.
	
	self assert: self serializer methodsToSerialize size equals: 2.
	self assertCollection: self serializer methodsToSerialize hasSameElements: methods asSet