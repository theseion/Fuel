initialization
prepare
	#(
		object
		additionalObjects
		hasMultipleObjects
		preMaterializationActions
		postMaterializationActions
		substitutions
		#objectLimit
		depthLimit
	) do: [ :key |
		map
			removeKey: key
			ifAbsent: [] ]