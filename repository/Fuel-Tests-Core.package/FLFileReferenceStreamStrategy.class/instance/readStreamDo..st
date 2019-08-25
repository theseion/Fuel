reading
readStreamDo: aValuable
	^ reference binaryReadStreamDo: [ :stream | aValuable value: stream ]