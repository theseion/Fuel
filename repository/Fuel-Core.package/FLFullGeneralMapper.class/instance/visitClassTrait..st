visiting
visitClassTrait: aClassTrait
	(self shouldSerializeBehaviorFully: aClassTrait)
		ifTrue: [
			self
				mapAndTraceByClusterName: aClassTrait
				to: FLClassTraitCluster ]
		ifFalse: [ next mapAndTrace: aClassTrait ]