private
useDuring: aBlock
	^ FLCurrentConfiguration
		value: self
		during: [
			| context |
			context := FLContext new.
			[ context useDuring: aBlock ] ensure: [
				context finalizeStream ] ]