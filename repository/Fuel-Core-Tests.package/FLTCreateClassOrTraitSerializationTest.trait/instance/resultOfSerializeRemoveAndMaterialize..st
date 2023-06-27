tests
resultOfSerializeRemoveAndMaterialize: aClass
	| materialized |
	self serializer fullySerializeBehavior: aClass.
	self serialize: aClass.
	self classFactory deleteBehavior: aClass.
	materialized := self materialized.
	self classFactory registerBehavior: materialized.
	^ materialized