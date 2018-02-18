initialization
initialize

	super initialize.

	self 
		useStandardFileStream;
		sample: (FLStructureSampleFactory sampleNamed: #completeBinaryTree)
