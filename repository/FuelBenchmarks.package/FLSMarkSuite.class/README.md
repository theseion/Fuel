FLStructureSampleFactory samples do: [ :sample |
	(self runSample: sample with: 5) inspect ]


FLStructureSampleFactory samples collect: [ :aSample |
	self defaultRunner 
		execute: (self new 
			sample: aSample; 
			useStandardFileStream;
			yourself)
		with: 5 ]