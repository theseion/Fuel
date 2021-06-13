private
useDuring: aBlock
	^ FLCurrentConfiguration
		value: self
		during: [
			FLCurrentContext
				value: FLContext new
				during: aBlock ]