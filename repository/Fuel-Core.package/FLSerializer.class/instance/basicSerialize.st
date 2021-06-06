serializing
basicSerialize
	| encoder |
	encoder := FLEncoder new.
	self
		encodeSignatureWith: encoder;
		encodeVersionWith: encoder;
		encodeHeaderWith: encoder.
	^ FLSerialization runWith: encoder