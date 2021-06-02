executing
executePreMaterializationActionsIn: anEnvironment
	preMaterializationActions do: [ :each |
		each
			cull: self
			cull: anEnvironment ]