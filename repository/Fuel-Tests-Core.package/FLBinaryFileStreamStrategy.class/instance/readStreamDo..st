reading
readStreamDo: aValuable
	"Evaluates the argument with a read stream. Answers the result."
	
	^ FLPlatform current
		fileNamed: self fileReference pathString
		readStreamDo: [ :aStream |
			aValuable value: aStream binary ]