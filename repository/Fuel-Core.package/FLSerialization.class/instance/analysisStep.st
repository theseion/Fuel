private
analysisStep

	| anAnalysis |
	anAnalysis := FLAnalysis runWith: FLAnalyzer new.
	clusters := anAnalysis clusterization clusters.
	encoder objectCount: anAnalysis clusterization objectCount.
	self possiblySubstituteRootFrom: anAnalysis