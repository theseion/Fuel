protected
verifySignatureFrom: aDecoder
	| streamSignature |
	streamSignature := ByteArray new: self configuration signature size.
	aDecoder nextEncodedBytesInto: streamSignature.
	(self configuration signature asByteArray = streamSignature) ifFalse: [ 
		FLBadSignature 
			signalCurrentSignature: self configuration signature 
			streamSignature: streamSignature ]
