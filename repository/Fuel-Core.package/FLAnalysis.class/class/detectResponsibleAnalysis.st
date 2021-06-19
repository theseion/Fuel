instance creation
detectResponsibleAnalysis
	^ (self allSubclasses sort: [ :a :b | a priority <= b priority ])
		detect: [ :class | class isResponsible ]
		ifNone: [ self ]