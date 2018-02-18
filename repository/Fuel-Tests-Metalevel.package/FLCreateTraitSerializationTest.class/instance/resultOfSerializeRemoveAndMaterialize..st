tests
resultOfSerializeRemoveAndMaterialize: aClass

	| materialized |
	self analyzer considerInternalBehavior: aClass.
	self serialize: aClass.
	self removeFromSystem: aClass.
	materialized := self materialized.
	"We need to track this trait for removal too"
	materialized isTrait ifTrue: [ 
		self traits add: materialized ].
	^ materialized