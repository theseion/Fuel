debugging
clusterInstancesStepOf: aCluster
	^ self logAndValue: [
		super clusterInstancesStepOf: aCluster.
		self log: 'cluster' -> aCluster ].
