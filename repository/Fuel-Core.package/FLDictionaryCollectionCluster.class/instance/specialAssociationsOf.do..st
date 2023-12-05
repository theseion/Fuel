analyzing
specialAssociationsOf: aDictionary do: aBlock
	aDictionary associationsDo: [ :association |
		association class isEphemeronClass
			ifFalse: [ aBlock value: association ]
			ifTrue: [
				self
					ephemeron: association
					do: aBlock ] ]