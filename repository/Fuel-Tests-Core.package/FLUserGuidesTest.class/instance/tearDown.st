running
tearDown
	#('demo.fuel' 'numbers.fuel' 'number.fuel.zip' 'example.FL')
		do: [ :each | self deleteFileNamed: each ].
	testingEnvironment removeKey: #GlobalSet1 ifAbsent: [  ].
	testingEnvironment removeKey: #GlobalSet2 ifAbsent: [  ].
	super tearDown