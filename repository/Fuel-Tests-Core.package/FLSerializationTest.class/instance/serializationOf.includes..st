helpers
serializationOf: anObject includes: anotherObject 
	self serialize: anObject.
	^ self materialization objects includes: anotherObject