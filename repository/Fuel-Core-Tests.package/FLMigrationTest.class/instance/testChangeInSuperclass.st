tests-automatic
testChangeInSuperclass
	"Tests that serializer tolarates when there is a change in the superclass between serialization and materialization"

	| aClass aClassSubclass instance materializedInstance |
	aClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'a b c'.
	aClassSubclass := self classFactory silentlyNewSubclassOf: aClass instanceVariableNames: 'd e'.

	instance := aClassSubclass new.
	instance instVarNamed: 'a' put: $A.
	instance instVarNamed: 'b' put: $B.
	instance instVarNamed: 'c' put: $C.
	instance instVarNamed: 'd' put: $D.
	instance instVarNamed: 'e' put: $E.

	self serialize: instance.
	aClass removeInstVarNamed: 'a'.
	aClass removeInstVarNamed: 'b'.
	aClass addInstVarNamed: 'x'.
	aClassSubclass superclass: aClass.

	materializedInstance := self materialized.

	self assert: $D equals: (materializedInstance instVarNamed: 'd').
	self assert: $E equals: (materializedInstance instVarNamed: 'e').
	self should: [ materializedInstance instVarNamed: 'a' ] raise: Error.
	self should: [ materializedInstance instVarNamed: 'b' ] raise: Error.
	self assert: $C equals: (materializedInstance instVarNamed: 'c').
	self assert: (materializedInstance instVarNamed: 'x') isNil