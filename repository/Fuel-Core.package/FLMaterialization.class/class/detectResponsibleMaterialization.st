instance creation
detectResponsibleMaterialization
	^ self allSubclasses
		detect: [ :class | class isResponsible ]
		ifNone: [ self ]