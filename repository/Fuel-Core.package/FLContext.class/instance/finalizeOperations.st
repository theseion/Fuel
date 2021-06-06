accessing
finalizeOperations
	self finalizers do: [ :finalizer |
		finalizer value ].
	self configuration streamFinalizer value: self stream