accessing
finalizeOperations
	self finalizers do: [ :finalizer |
		finalizer value ].
	
	self shouldFinalizeStream ifFalse: [ ^ self ].
	self configuration shouldFinalizeStream ifFalse: [ ^ self ].
	
	self configuration streamFinalizer value: self stream