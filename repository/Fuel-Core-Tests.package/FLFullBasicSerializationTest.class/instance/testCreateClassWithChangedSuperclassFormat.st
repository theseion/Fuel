tests-bugs
testCreateClassWithChangedSuperclassFormat
	"Tests issue #221"

	| a b |
	a := self classFactory make: [ :aBuilder | aBuilder slotsFromString: 'one' ].
	b := self classFactory make: [ :aBuilder |
		     aBuilder
			     superclass: a;
			     slotsFromString: 'two' ].
	self serializer fullySerializeBehavior: b.
	self serialize: {
			b new.
			b }.

	a addInstVarNamed: 'newIVar'.

	self shouldnt: [ self materialized ] raise: PrimitiveFailed