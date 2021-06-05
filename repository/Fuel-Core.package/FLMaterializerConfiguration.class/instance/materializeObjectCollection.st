materializing
materializeObjectCollection
	^ FLCurrentConfiguration
		value: self
		during: [ self materializer materializeObjectCollection ]