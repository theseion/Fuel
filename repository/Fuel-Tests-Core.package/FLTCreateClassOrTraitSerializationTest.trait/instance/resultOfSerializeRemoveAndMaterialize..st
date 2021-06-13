tests
resultOfSerializeRemoveAndMaterialize: aClass
	| materialized |
	self serializer considerInternalBehavior: aClass.
	self serialize: aClass.
	self classFactory deleteBehavior: aClass.
	materialized := self materialized.
	self classFactory registerBehavior: materialized.
	^ materialized