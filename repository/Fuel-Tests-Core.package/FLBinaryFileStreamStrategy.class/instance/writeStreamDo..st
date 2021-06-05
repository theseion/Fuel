writing
writeStreamDo: aValuable
	"Evaluates the argument with a write stream. Answers the result."

	^ FLPlatform current
		fileNamed: self fileReference pathString
		writeStreamDo: [ :aStream | 
			aValuable value: aStream binary ]