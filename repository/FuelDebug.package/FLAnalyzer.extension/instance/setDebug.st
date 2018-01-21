*FuelDebug-configuring
setDebug

	analysisFactory := [:anObject | 
		(FLDebugAnalysis 
			newWith: self firstInMapperChain 
			private: self privateFirstInMapperChain
			root: anObject)
			run;
			yourself ]