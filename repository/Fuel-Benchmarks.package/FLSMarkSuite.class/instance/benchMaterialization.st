benchmarking
benchMaterialization

	self streamFactory readStreamDo: [ :aStream |	
		FLMaterializer new materializeFrom: aStream ]