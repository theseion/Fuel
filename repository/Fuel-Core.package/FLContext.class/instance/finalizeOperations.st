accessing
finalizeOperations
	self finalizers do: [ :finalizer |
		finalizer value ].
	
	self configuration shouldFinalizeStream ifFalse: [ ^ self ].
	
	self configuration streamFinalizer value: self stream