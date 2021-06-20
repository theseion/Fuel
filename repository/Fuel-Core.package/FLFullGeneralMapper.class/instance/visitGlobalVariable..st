visiting
visitGlobalVariable: aGlobalVariable
	"Consider class variables global that can be looked up, unless
	the associated class (if any) should be fully serialized"
	((globals includesKey: aGlobalVariable key) or: [
		(aGlobalVariable value isBehavior and: [
			self shouldSerializeBehaviorFully: aGlobalVariable value ]) not ])
				ifTrue: [
					self
						mapAndTraceByClusterName: aGlobalVariable
						to: FLGlobalAssociationCluster ]
				ifFalse: [ next mapAndTrace: aGlobalVariable ]