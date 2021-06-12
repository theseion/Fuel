initialization
initialize

	super initialize.

	self 
		useByteArrayStream;
		sample: (FLStructureSampleFactory sampleNamed: #completeBinaryTree)
