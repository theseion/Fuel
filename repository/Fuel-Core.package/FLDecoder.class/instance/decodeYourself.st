decoding
decodeYourself
	| objectCount |
	objectCount := self nextEncodedUint32.
	indexStream := FLIndexStream
		on: stream
		digits: objectCount bytesCount.
	objects := Array new: objectCount.
	objectsWriteStream := WriteStream on: objects.
	isBigEndian := self nextEncodedUint32