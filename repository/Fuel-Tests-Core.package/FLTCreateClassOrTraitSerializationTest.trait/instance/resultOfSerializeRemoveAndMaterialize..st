tests
resultOfSerializeRemoveAndMaterialize: aClass
	| materialized |
	self analyzer considerInternalBehavior: aClass.
	self
		serialize: aClass;
		removeFromSystem: aClass.
	materialized := self materialized.
	self classFactory registerBehavior: materialized.
	^ materialized