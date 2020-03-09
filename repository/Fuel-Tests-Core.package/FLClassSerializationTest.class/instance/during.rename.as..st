tests
during: aBlock rename: aClass as: anotherClass

	[ testingEnvironment at: aClass name put: anotherClass.
	^aBlock value ] ensure: [ 
	testingEnvironment at: aClass name put: aClass ].