visiting
visitCompiledMethod: aCompiledMethod
	(self shouldSerializeCompiledMethodFully: aCompiledMethod)
		ifTrue: [
			self
				mapAndTraceByClusterName: aCompiledMethod
				to: FLCompiledMethodCluster ]
		ifFalse: [ next mapAndTrace: aCompiledMethod ]
	
