visiting
visitCompiledBlock: aCompiledBlock
	self
		mapAndTraceByClusterName: aCompiledBlock
		to: ((aCompiledBlock method isInstalled not or: [ aCompiledBlock method isDoIt ])
			ifTrue: [ FLCompiledBlockCluster ]
			ifFalse: [ FLGlobalCompiledBlockCluster ])