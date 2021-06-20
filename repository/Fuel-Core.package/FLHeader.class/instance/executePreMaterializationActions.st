executing
executePreMaterializationActions
	preMaterializationActions ifNil: [ ^ self ].

	preMaterializationActions do: [ :each |
		each
			cull: self context materializedObjects
			cull: self configuration environment ]