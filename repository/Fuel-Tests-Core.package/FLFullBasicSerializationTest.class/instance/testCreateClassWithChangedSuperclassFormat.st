tests-bugs
testCreateClassWithChangedSuperclassFormat
	"Tests issue #221"

	| a b |
	a := self newSubclassOf: Object instanceVariableNames: 'one' classVariableNames: ''.
	b := self newSubclassOf: a instanceVariableNames: 'two' classVariableNames: ''.
	self analyzer considerInternalBehavior: b.
	self serialize: {b new. b}.
	
	a addInstVarNamed: 'newIVar'.
		
	self
		shouldnt: [ self materialized ]
		raise: PrimitiveFailed