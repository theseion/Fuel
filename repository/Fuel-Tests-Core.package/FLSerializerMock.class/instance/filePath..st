accessing
filePath: aString
	"For tests only, allow stream factory to be overridden, because
	we set the factory during set up"
	map
		removeKey: #streamFactory
		ifAbsent: [].
		
	super filePath: aString