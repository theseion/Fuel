private
registerAll: aCollection

	self notifyMaterializedAll: aCollection.
	^ super registerAll: aCollection