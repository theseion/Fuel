tests-configuring-globals
testLookUpInGlobalsSymbolKey
	| object |
	object := Object new.
	self environmentOfTest
		at: #aGlobal
		put: object.
	self serializer lookUpInGlobals: #aGlobal.
	
	self assert: (self serializer globals includesKey: #aGlobal).
	self assert: (self serializer globals at: #aGlobal) identicalTo: object.
	self deny: (self serializer globals includesKey: object)