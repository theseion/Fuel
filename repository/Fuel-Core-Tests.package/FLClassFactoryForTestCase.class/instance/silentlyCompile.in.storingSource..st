compiling-silently
silentlyCompile: aString in: aBehavior storingSource: aBoolean
	^ self
		silentlyCompile: aString
		in: aBehavior
		category: 'unclassified'
		storingSource: aBoolean