private-extensions-methodcontext
tempNamed: aName put: anObject
	<flExtensionOf: #MethodContext>
	| index |
	index := self tempNames indexOf: aName.
	^ self closure 
		ifNil: [
			self
				tempAt: index
				put: anObject ]
		ifNotNilDo: [ :closure |
			closure
				at: index
				put: anObject ]