benchmarking
setUpBenchMaterialization

	self streamFactory writeStreamDo: [ :aStream |
		FLSerializer 
			serialize: self sampleContents
			on: aStream ].