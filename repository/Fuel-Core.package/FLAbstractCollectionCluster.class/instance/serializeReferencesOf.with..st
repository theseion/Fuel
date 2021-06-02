serialize/materialize
serializeReferencesOf: anObject with: anEncoder
	self
		encodeExtraInformationForReferencesFor: anObject with: anEncoder;
		encodeSizeOf: anObject with: anEncoder.
	
	self references
		at: anObject
		ifPresent: [ :refs |
			refs do: [ :ref |
				anEncoder encodeReferenceTo: ref ] ]
	