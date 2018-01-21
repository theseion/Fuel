instance creation
new

	^ self basicNew
		initializeWith: self defaultProblemSize;
		yourself.