private
nodeFor: anObject

	^ elementByObjectMap 
		at: anObject 
		ifAbsentPut: (self newNodeFor: anObject)