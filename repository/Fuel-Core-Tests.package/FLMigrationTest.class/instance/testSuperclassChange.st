tests-automatic
testSuperclassChange
	"Tests that serializer tolarates when the superclass changed between serialization and materialization"

	| aClass aClassSubclass instance materializedInstance anotherSuperclass |
	aClass := self classFactory make: [ :aBuilder | aBuilder slots: #(a b c) ].
	aClassSubclass := self classFactory make: [ :aBuilder |
		                  aBuilder
			                  superclass: aClass;
			                  slots: #(d e) ].
	anotherSuperclass := self classFactory make: [ :aBuilder | aBuilder slots: #(x) ].

	instance := aClassSubclass new.
	instance instVarNamed: 'a' put: $A.
	instance instVarNamed: 'b' put: $B.
	instance instVarNamed: 'c' put: $C.
	instance instVarNamed: 'd' put: $D.
	instance instVarNamed: 'e' put: $E.

	self serialize: instance.
	aClassSubclass superclass: anotherSuperclass.
	materializedInstance := self materialized.

	self assert: $D equals: (materializedInstance instVarNamed: 'd').
	self assert: $E equals: (materializedInstance instVarNamed: 'e').
	self should: [ materializedInstance instVarNamed: 'a' ] raise: Error.
	self should: [ materializedInstance instVarNamed: 'b' ] raise: Error.
	self should: [ materializedInstance instVarNamed: 'c' ] raise: Error.
	self assert: (materializedInstance instVarNamed: 'x') isNil