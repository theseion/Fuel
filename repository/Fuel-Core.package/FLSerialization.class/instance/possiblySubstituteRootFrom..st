as yet unclassified
possiblySubstituteRootFrom: anAnalysis
	"The root object may have been substituted. We need to update the
	object in the configuration to reflect the actual root object"
	anAnalysis clusterization substitutionsBucket
		at: FLSubstitutionCluster
		ifPresent: [ :cluster |
			cluster substitutions
				at: self configuration object
				ifPresent: [ :substitute |
					self configuration object: substitute ] ]