instance creation
newWith: aDictionaryClass

	^self basicNew 
		initializeWith: aDictionaryClass;
		yourself