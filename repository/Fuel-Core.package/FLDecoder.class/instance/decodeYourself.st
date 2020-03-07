decoding
decodeYourself
	| objectCount |
	objectCount := self nextEncodedPositiveInteger.
	indexStream := FLIndexStream
		on: stream
		digits: objectCount bytesCount.
	objects := Array new: objectCount.
	objectsWriteStream := WriteStream on: objects.
	isBigEndian := self nextEncodedPositiveInteger