analyzing
specialAssociationsOf: aDictionary do: aBlock
	aDictionary associationsDo: [ :association |
		association fuelIsEphemeron
			ifFalse: [ aBlock value: association ]
			ifTrue: [
				self
					ephemeron: association
					do: aBlock ] ]