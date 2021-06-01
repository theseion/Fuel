helpers
useNotInstalled
	self classFactory
		silentlyCompile: 'm  ^ 42'
		in: theClass
		storingSource: false.
	theCompiledMethod := theClass methodNamed: #m.
	theClass methodDict removeKey: #m