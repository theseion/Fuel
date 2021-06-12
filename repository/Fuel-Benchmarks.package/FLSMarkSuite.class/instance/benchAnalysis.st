benchmarking
benchAnalysis
	FLSerializerConfiguration new
		object: self sampleContents;
		streamFactory: [ ByteArray new writeStream ];
		useDuring: [
			FLAnalysis runWith: FLAnalyzer new ]