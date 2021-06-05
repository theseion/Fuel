instance creation
basicRunWith: aDecoder
	^ self basicNew
		initializeWith: aDecoder;
		initialize;
		run;
		yourself