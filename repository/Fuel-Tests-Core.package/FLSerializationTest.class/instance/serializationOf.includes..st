helpers
serializationOf: anObject includes: anotherObject 
	self serialize: anObject.
	^ self materializedObjects objects includes: anotherObject