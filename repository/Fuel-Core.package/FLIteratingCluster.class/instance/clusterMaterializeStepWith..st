serialize/materialize
clusterMaterializeStepWith: aDecoder

	super clusterMaterializeStepWith: aDecoder.
	objects := Array new: aDecoder nextEncodedUint32