private
headerStep

	numberOfObjectsAlreadySerialized := 0.
	numberOfObjectsToSerialize := encoder objectCount.
	^ super headerStep.