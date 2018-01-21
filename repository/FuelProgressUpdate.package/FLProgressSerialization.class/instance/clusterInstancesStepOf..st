private
clusterInstancesStepOf: aCluster

	self notifySerialized: aCluster.
	^ super clusterInstancesStepOf: aCluster.
