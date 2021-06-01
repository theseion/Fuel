visiting
visitTraitedMetaclass: aMetaclass
	(self shouldSerializeBehaviorFully: aMetaclass)
		ifTrue: [
			self
				mapAndTraceByClusterName: aMetaclass
				to: FLTraitedMetaclassCluster ]
		ifFalse: [ next mapAndTrace: aMetaclass ]