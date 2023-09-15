tests-strings
testWideStringGlobal
	| global globalValue |
	global := 'Foox' asWideString
		at: 4 put: (Character value: 265);
		yourself.
	globalValue := global , 'value'.
	self environmentOfTest
		at: global
		put: globalValue.
	addedGlobals add: global.
	self serializer lookUpInGlobals: global.

	self shouldnt: [ self serialize: 'bar' -> globalValue ] raise: Error.
	self assert: self materialized class equals: Association.
	self assert: self materialized value identicalTo: global