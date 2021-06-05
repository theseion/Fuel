protected
verifyVersionFrom: aDecoder

	| streamVersion |
	streamVersion := FLVersion
		newWithMajor: aDecoder nextEncodedByte
		minor: aDecoder nextEncodedByte
		patch: aDecoder nextEncodedByte.
	(self configuration version = streamVersion) ifFalse: [ 
		FLBadVersion 
			signalCurrentVersion: self configuration version 
			streamVersion: streamVersion ]
