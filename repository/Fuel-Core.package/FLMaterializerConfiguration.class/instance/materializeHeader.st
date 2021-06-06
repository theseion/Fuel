materializing
materializeHeader
	^ self useDuring: [
		self materializer materializeHeader ]