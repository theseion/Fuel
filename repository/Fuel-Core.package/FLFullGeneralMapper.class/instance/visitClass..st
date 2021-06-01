visiting
visitClass: aClass
	(self shouldSerializeBehaviorFully: aClass)
		ifTrue: [
			self
				mapAndTraceByClusterName: aClass
				to: FLClassCluster ]
		ifFalse: [ next mapAndTrace: aClass ]