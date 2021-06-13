initialization
prepare
	#(
		additionalObjects
		hasMultipleObjects
		preMaterializationActions
		postMaterializationActions
		whenBlocks
	) do: [ :key |
		map
			removeKey: key
			ifAbsent: [] ]