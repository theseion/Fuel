initialization
initialize

	super initialize.

	self 
		useBinaryFileStream;
		sample: (FLStructureSampleFactory sampleNamed: #completeBinaryTree)
