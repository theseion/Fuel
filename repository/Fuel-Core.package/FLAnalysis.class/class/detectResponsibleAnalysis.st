instance creation
detectResponsibleAnalysis
	^ self allSubclasses
		detect: [ :class | class isResponsible ]
		ifNone: [ self ]