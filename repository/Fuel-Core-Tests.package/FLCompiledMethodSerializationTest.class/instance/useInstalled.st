helpers
useInstalled
	self classFactory
		silentlyCompile: 'm  ^ 42'
		in: theClass
		storingSource: true.
	theCompiledMethod := theClass methodNamed: #m