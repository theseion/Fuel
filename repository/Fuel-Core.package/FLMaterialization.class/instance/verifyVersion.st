materializing
verifyVersion
	| decodedVersion |
	decodedVersion := decoder decodeVersion.
	(self configuration version = decodedVersion) ifFalse: [ 
		FLBadVersion 
			signalCurrentVersion: self configuration version 
			streamVersion: decodedVersion ]
