serialize/materialize
serializeInstance: aWordObject with: anEncoder
	anEncoder
		encodeUint32: aWordObject basicSize;
		encodeWords: aWordObject