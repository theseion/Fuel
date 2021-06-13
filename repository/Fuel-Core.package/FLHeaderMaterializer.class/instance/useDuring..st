serializing
useDuring: aBlock
	| stream |
	stream := FLCurrentContext value stream.
	^ super useDuring: [
		FLCurrentContext value stream: stream.
		aBlock value ]