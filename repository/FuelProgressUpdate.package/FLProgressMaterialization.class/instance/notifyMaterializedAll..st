progress handling
notifyMaterializedAll: aCollection
	
	numberOfObjectsAlreadyMaterialized := numberOfObjectsAlreadyMaterialized + aCollection size.
	progressBar current: self progress.