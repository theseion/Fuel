benchmarking
setUpBenchMaterialization

	FLSerializer new
		object: self sampleContents;
		streamFactory: [ self streamFactory writeStream ];
		serialize