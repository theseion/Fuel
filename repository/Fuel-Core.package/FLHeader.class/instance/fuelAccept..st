hooks
fuelAccept: aGeneralMapper
	"The header is actually being serialized. Override the trait"
	self isEmpty
		ifFalse: [ super fuelAccept: aGeneralMapper ]
		ifTrue: [
			aGeneralMapper
				visitSubstitution: self
				by: nil ]