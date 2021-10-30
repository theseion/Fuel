*Fuel-Core
fuelAccept: aGeneralMapper

	^ self shouldBeSubstitutedByMinimalCopy
		"The 'onRecursionDo:' is just to avoid an infinitive loop for the substitution"
		ifTrue: [
			aGeneralMapper
				visitSubstitution: self
				by: self cleanCopy
				onRecursionDo: [ aGeneralMapper visitVariableObject: self ]  ]
		ifFalse: [ aGeneralMapper visitVariableObject: self ]