serialize/materialize
clusterSerializeStepWith: anEncoder

	super clusterSerializeStepWith: anEncoder.
	anEncoder encodeUint32: objects size