*FuelProgressUpdate-configuring
showProgress

	materializationFactory := [:aDecoder | 
		(FLProgressMaterialization 
			with: aDecoder)
			run;
			yourself ]