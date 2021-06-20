tests-configuring-globals
testLookUpInGlobalsPassingValue
	| object1 object2 |
	object1 := Object new.
	object2 := Object new.
	self environmentOfTest
		at: object1
		put: object2.
	self serializer lookUpInGlobals: object2.
	
	self assert: (self serializer globals includesKey: object1).
	self assert: (self serializer globals at: object1) identicalTo: object2.
	self deny: (self serializer globals includesKey: object2)