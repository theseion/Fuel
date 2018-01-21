progress handling
notifySerialized: aCluster

	numberOfObjectsAlreadySerialized := numberOfObjectsAlreadySerialized + aCluster objects size.
	progressBar current: self progress.