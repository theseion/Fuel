benchmarking
benchAnalysis
	FLSerializer new
		object: self sampleContents;
		streamFactory: [ ByteArray new writeStream ];
		useDuring: [ FLAnalysis run ]