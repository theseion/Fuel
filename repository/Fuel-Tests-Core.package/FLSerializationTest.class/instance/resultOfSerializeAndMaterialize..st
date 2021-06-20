helpers
resultOfSerializeAndMaterialize: anObject
	^ self
		serialize: anObject;
		materialized
