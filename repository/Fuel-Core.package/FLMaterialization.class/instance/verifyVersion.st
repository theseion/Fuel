materializing
verifyVersion
	| decodedVersion |
	decodedVersion := decoder decodeVersion.
	self configuration version major = decodedVersion major ifTrue: [
		^ self ].
	
	FLBadVersion
		signalCurrentVersion: self configuration version 
		streamVersion: decodedVersion