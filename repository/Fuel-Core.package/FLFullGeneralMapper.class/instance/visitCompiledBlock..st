visiting
visitCompiledBlock: aCompiledBlock
	(self shouldSerializeCompiledMethodFully: aCompiledBlock method)
		ifTrue: [
			self
				mapAndTraceByClusterName: aCompiledBlock
				to: FLCompiledBlockCluster ]
		ifFalse: [ next mapAndTrace: aCompiledBlock ]