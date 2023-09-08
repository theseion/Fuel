tests
resultOfSerializeRemoveAndMaterialize: aClass

	| materialized wasSilent |
	self serializer fullySerializeBehavior: aClass.
	self serialize: aClass.
	wasSilent := self classFactory createdSilently includes: aClass.
	self classFactory delete: aClass.
	materialized := self materialized.
	self classFactory registerBehavior: materialized.
	wasSilent ifTrue: [ self classFactory createdSilently add: materialized ].
	^ materialized