running
materialize
	^ self useDuring: [
		FLMaterialization run root ]