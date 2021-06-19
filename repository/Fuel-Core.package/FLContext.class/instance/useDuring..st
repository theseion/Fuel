evaluating
useDuring: aBlock
	^ FLCurrentContext
		value: self
		during: aBlock