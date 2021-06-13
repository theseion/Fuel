initialization
prepare
	#(
		additionalObjects
		hasMultipleObjects
		preMaterializationActions
		postMaterializationActions
		shouldMaterializeHeaderOnly
	) do: [ :key |
		map
			removeKey: key
			ifAbsent: [] ]