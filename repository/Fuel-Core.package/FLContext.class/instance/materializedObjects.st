accessing
materializedObjects
	^ map
		at: #materializedObjects
		ifAbsentPut: [ FLMaterializedObjects new ]