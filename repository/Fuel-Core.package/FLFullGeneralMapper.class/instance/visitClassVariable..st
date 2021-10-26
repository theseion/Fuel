visiting
visitClassVariable: aClassVariable
	"Consider class variables regular objects (not globals), unless
	their owning class is being fully serialized, in which case the class
	variable needs to be serialized fully as well."
	(self shouldSerializeBehaviorFully: aClassVariable owningClass)
		ifFalse: [
			self
				mapAndTraceByClusterName: aClassVariable
				to: FLGlobalClassVariableCluster ]
		ifTrue: [ next mapAndTrace: aClassVariable ]