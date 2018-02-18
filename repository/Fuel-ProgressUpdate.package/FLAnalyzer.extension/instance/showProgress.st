*Fuel-ProgressUpdate-configuring
showProgress

	analysisFactory := [:anObject | 
		(FLProgressAnalysis 
			newWith: self firstInMapperChain 
			private: self privateFirstInMapperChain
			root: anObject)
			run;
			yourself ]