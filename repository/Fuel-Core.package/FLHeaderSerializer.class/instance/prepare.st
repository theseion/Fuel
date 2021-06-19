initialization
prepare
	#(
		object
		additionalObjects
		hasMultipleObjects
		preMaterializationActions
		postMaterializationActions
		substitutions
		objectsLimit
		depthLimit
	) do: [ :key |
		map
			removeKey: key
			ifAbsent: [] ]