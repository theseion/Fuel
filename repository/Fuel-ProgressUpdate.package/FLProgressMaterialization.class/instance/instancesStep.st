private
instancesStep

	numberOfObjectsAlreadyMaterialized := 0.
	numberOfObjectsToMaterialize := decoder objects capacity.
	^ super instancesStep.
