executing
executePostMaterializationActions
	postMaterializationActions ifNil: [ ^ self ].
	
	postMaterializationActions do: [ :each |
		each
			cull: self context materializedObjects
			cull: self configuration environment ]