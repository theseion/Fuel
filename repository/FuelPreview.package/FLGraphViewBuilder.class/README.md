I add draw capabilities to analysis in FuelDebug package.

Right-click a node for inspect it. Some examples:

(FLAnalyzer newDefault
	setDebug;
	analysisFor: #((1) (2) (3) (4)))
	open.

(FLAnalyzer newDefault
	setDebug;
	analysisFor: #((1) (2) (3) (4)))
	openPathsTo: 3.
	
(FLAnalyzer newDefault
	setDebug;
	analysisFor: #((1) (2) (3) (4)))
	openPathsToEvery: [:o | o isNumber and: [o > 2] ].
	
