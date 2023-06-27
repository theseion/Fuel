compiling-silently
silentlyCompile: aString in: aBehavior
	^ self
		silentlyCompile: aString
		in: aBehavior
		storingSource: true