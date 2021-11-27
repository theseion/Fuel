serialize/materialize
serializeReferencesOf: anObject with: anEncoder
	| refs |
	refs := self references
		at: anObject
		ifAbsent: [ ^ self ].
	
	anEncoder encodeUint32: refs first.

	refs
		from: 2
		to: refs size
		do: [ :ref | anEncoder encodeReferenceTo: ref ]