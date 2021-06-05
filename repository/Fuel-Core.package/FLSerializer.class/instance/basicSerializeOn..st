serializing
basicSerializeOn: aStream
	FLEncoder
		on: aStream 
		globalEnvironment: self configuration environment
		do: [ :anEncoder | 
			self encodeSignatureWith: anEncoder.
			self encodeVersionWith: anEncoder.
			self encodeHeaderWith: anEncoder.
			^ FLSerialization runWith: anEncoder ]