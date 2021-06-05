instance creation
basicRunWith: anEncoder
	^ self basicNew
		initializeWith: anEncoder;
		run;
		yourself