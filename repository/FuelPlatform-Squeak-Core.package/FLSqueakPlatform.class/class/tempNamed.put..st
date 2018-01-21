private-extensions-context
tempNamed: aName put: anObject
	<flExtensionOf: #Context>
	^ self tempAt: (self tempNames indexOf: aName) put: anObject