running
tearDownEnvironment
	addedGlobals do: [ :key |
		self environmentOfTest
			removeKey: key
			ifAbsent: [] ]