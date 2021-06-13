private
clusterPostMaterializationStep

	clusters do: [ :aCluster | aCluster afterMaterializationStepWith: decoder ]