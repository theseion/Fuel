testing
expectedFailures
	^ FLPlatform current
		expectedFailuresOf: self class
		inherited: super expectedFailures asOrderedCollection