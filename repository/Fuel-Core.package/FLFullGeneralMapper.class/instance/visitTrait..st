visiting
visitTrait: aTrait
	(self shouldSerializeBehaviorFully: aTrait)
		ifTrue: [
			self
				mapAndTraceByClusterName: aTrait
				to: FLTraitCluster ]
		ifFalse: [ next mapAndTrace: aTrait ]