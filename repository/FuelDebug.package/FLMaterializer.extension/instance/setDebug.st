*FuelDebug-configuring
setDebug

	materializationFactory := [:aDecoder | 
		(FLDebugMaterialization 
			with: aDecoder)
			run; 
			yourself ]
	
	
