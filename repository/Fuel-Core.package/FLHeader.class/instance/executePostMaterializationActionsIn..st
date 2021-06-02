executing
executePostMaterializationActionsIn: anEnvironment
	postMaterializationActions do: [ :each |
		each
			cull: self
			cull: materialization
			cull: anEnvironment ]