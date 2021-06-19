tests
testObject
	| object |
	object := Object new.
	self serializer object: object.
	self assert: self serializer object identicalTo: object