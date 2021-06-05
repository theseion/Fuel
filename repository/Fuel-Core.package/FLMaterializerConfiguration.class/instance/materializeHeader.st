materializing
materializeHeader
	^ FLCurrentConfiguration
		value: self
		during: [ self materializer materializeHeader ]