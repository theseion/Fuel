instance creation
forSerialization
	^ self basicNew
		initializeForSerialization;
		initialize;
		yourself