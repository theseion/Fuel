executing
executePreMaterializationActions
	preMaterializationActions ifNil: [ ^ self ].

	preMaterializationActions do: [ :each |
		each
			cull: self
			cull: self configuration environment ]