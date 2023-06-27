running
tearDown
	#('demo.fuel' 'numbers.fuel' 'number.fuel.zip' 'example.FL') do: [ :aFilename |
		self deleteFilePath: aFilename ].

	super tearDown