decoding
decodeSignature
	| streamSignature |
	streamSignature := ByteArray new: self configuration signature size.
	self nextEncodedBytesInto: streamSignature.
	^ streamSignature