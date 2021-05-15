visiting
visitCompiledMethod: aCompiledMethod
	self
		mapAndTraceByClusterName: aCompiledMethod
		to: ((aCompiledMethod isInstalled not or: [aCompiledMethod isDoIt ])
			ifTrue: [ FLCompiledMethodCluster ]
			ifFalse: [ FLGlobalCompiledMethodCluster ])