benchmarking
benchMaterialization
	FLMaterializerConfiguration new
			streamFactory: [ self streamFactory readStream ];
			materialize