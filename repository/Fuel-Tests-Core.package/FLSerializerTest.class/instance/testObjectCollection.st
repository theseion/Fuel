tests-configuring
testObjectCollection
	| array |
	array := Array new: 0.
	self deny: self serializer hasMultipleObjects.
	
	self serializer objectCollection: array.
	self assert: self serializer object identicalTo: array.
	self assert: self serializer hasMultipleObjects
	