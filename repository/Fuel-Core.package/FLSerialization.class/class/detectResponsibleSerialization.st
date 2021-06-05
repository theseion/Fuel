instance creation
detectResponsibleSerialization
	^ self allSubclasses
		detect: [ :class | class isResponsible ]
		ifNone: [ self ]