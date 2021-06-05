enumerating
streamDo: aBlock
	| stream |
	stream := self streamFactory value.
	^ [ aBlock value: stream ] ensure: [
		self streamFinalizer value: stream ]