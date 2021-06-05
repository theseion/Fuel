reading
readStreamDo: aValuable
	^ fileReference binaryReadStreamDo: [ :stream | aValuable value: stream ]