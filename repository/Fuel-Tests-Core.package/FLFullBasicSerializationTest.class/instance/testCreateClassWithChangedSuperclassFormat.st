tests-bugs
testCreateClassWithChangedSuperclassFormat
	"Tests issue #221"

	| a b |
	a := self classFactory silentlyNewClassWithInstanceVariableNames: 'one'.
	b := self classFactory silentlyNewSubclassOf: a instanceVariableNames: 'two'.
	self serializerConfig considerInternalBehavior: b.
	self serialize: {b new. b}.
	
	a addInstVarNamed: 'newIVar'.
		
	self
		shouldnt: [ self materialized ]
		raise: PrimitiveFailed