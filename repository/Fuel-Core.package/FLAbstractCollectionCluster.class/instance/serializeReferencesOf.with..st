serialize/materialize
serializeReferencesOf: anObject with: anEncoder
	| refs |
	refs := self references
		at: anObject
		ifAbsent: [ ^ self ].
	
	anEncoder encodePositiveInteger: refs first.
	refs
		from: (2 min: refs size)
		to: refs size
		do: [ :ref | anEncoder encodeReferenceTo: ref ]
	