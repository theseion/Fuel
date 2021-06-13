materializing
verifySignature
	| decodedSignature |
	decodedSignature := decoder decodeSignature.
	(self configuration signature asByteArray = decodedSignature) ifFalse: [ 
		FLBadSignature 
			signalCurrentSignature: self configuration signature 
			streamSignature: decodedSignature ]