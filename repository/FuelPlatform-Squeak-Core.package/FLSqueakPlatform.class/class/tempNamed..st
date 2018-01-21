private-extensions-context
tempNamed: aName
	<flExtensionOf: #Context>
	^ self tempAt: (self tempNames indexOf: aName)