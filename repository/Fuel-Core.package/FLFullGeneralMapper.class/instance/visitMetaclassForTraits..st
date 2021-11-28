visiting
visitMetaclassForTraits: aMetaclass
	(self shouldSerializeBehaviorFully: aMetaclass)
		ifTrue: [
			self
				mapAndTraceByClusterName: aMetaclass
				to: FLMetaclassForTraitsCluster ]
		ifFalse: [ next mapAndTrace: aMetaclass ]