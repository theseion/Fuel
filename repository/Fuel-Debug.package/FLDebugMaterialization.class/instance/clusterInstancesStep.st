debugging
clusterInstancesStep
	^ self logAndValue: [
		super clusterInstancesStep.
		self log: 'cluster' -> clusters last ].