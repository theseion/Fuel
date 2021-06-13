decoding
decodeVersion
	^ FLVersion
		newWithMajor: self nextEncodedByte
		minor: self nextEncodedByte
		patch: self nextEncodedByte