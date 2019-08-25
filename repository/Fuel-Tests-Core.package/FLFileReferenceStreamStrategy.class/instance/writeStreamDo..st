writing
writeStreamDo: aValuable
	^ reference binaryWriteStreamDo: [ :stream | aValuable value: stream ]