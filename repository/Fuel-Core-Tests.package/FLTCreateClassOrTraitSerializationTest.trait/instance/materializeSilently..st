helpers
materializeSilently: aBoolean

	| materialized |
	materialized := self materialized.
	self classFactory registerBehavior: materialized.
	aBoolean ifTrue: [ self classFactory createdSilently add: materialized ].
	^ materialized