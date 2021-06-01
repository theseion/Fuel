running
tearDown
	#('demo.fuel' 'numbers.fuel' 'number.fuel.zip' 'example.FL')
		do: [ :each | self deleteFileNamed: each ].

	super tearDown