tests-configuring-globals
testLookUpInGlobalsObjectKey
	| object marge |
	object := Object new.
	marge := 'Marge'.
	self environmentOfTest
		at: object
		put: marge.
	addedGlobals add: object.
	self serializer lookUpInGlobals: object.

	self assert: (self serializer globals includesKey: object).
	self assert: (self serializer globals at: object) identicalTo: marge.
	self deny: (self serializer globals includesKey: marge)