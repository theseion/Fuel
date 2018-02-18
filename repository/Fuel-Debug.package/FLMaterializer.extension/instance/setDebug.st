*Fuel-Debug-configuring
setDebug

	materializationFactory := [:aDecoder | 
		(FLDebugMaterialization 
			with: aDecoder)
			run; 
			yourself ]
	
	
