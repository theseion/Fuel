serialize/materialize
clusterSerializeStepWith: aSerialization

	super clusterSerializeStepWith: aSerialization.
	aSerialization encoder encodeUint32: objects size