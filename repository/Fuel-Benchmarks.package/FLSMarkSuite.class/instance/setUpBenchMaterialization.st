benchmarking
setUpBenchMaterialization

	FLSerializerConfiguration new
		object: self sampleContents;
		streamFactory: [ self streamFactory writeStream ];
		serialize