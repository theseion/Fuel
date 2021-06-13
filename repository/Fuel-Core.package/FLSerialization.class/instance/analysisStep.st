private
analysisStep

	| anAnalysis |
	anAnalysis := FLAnalysis run.
	clusters := anAnalysis clusterization clusters.
	encoder objectCount: anAnalysis clusterization objectCount.
	self possiblySubstituteRootFrom: anAnalysis