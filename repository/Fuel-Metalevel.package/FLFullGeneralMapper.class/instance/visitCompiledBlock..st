visiting
visitCompiledBlock: aCompiledBlock
	self
		mapAndTraceByClusterName: aCompiledBlock
		to: FLCompiledBlockCluster
