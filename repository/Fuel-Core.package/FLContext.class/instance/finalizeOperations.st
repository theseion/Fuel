finalization
finalizeOperations
	self finalizers do: [ :finalizer |
		finalizer value ]