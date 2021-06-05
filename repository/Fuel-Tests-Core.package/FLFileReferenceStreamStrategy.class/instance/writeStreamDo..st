writing
writeStreamDo: aValuable
	^ self fileReference binaryWriteStreamDo: [ :stream | aValuable value: stream ]