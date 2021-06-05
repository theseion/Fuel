instance creation
newWithMajor: majorNumber minor: minorNumber patch: patchNumber
	^ self basicNew
		initializeWithMajor: majorNumber minor: minorNumber patch: patchNumber;
		initialize;
		yourself