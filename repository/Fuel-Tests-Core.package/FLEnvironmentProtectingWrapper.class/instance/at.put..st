accessing
at: key put: anObject
	"This produces GlobalVariable instances"
	(overlay includesKey: key) ifFalse: [
		overlay
			declare: key
			from: Undeclared ].

	^ overlay
		at: key
		put: anObject