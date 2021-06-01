visiting
visitMetaclass: aMetaclass
	(self shouldSerializeBehaviorFully: aMetaclass)
		ifTrue: [
			self
				mapAndTraceByClusterName: aMetaclass
				to: FLMetaclassCluster]
		ifFalse: [ next mapAndTrace: aMetaclass ]