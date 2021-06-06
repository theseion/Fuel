instance creation
runWith: anAnalyzer
	^ (self detectResponsibleAnalysis
		newWith: anAnalyzer firstInMapperChain
		private: anAnalyzer privateFirstInMapperChain
		root: self context object)
			run;
			yourself