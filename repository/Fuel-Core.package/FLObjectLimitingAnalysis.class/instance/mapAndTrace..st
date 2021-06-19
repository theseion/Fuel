mapping
mapAndTrace: anObject
	"Don't count nil as an object"
	anObject ifNil: [
		super mapAndTrace: anObject.
		^ self ].
	
	objectCounter := objectCounter + 1.
	
	objectCounter > objectLimit
		ifTrue: [
			self context handleObjectLimitExceeded.
			firstMapper
				visitSubstitution: anObject
				by: nil ]
		ifFalse: [ super mapAndTrace: anObject ]