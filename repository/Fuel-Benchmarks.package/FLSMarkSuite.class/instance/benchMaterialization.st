benchmarking
benchMaterialization
	FLMaterializer new
			streamFactory: [ self streamFactory readStream ];
			materialize