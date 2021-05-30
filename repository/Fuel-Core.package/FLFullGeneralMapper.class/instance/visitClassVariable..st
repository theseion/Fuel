visiting
visitClassVariable: aClassVariable
	"Consider class variables global that can be looked up, unless
	their owning class is being fully serialized"
	(self shouldSerializeBehaviorFully: aClassVariable owningClass)
		ifFalse: [
			self
				mapAndTraceByClusterName: aClassVariable
				to: FLGlobalClassVariableCluster ]
		ifTrue: [ next mapAndTrace: aClassVariable ]