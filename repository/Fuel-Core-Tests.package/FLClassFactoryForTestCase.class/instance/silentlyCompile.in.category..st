compiling-silently
silentlyCompile: aString in: aBehavior category: anotherString
	^ self
		silentlyCompile: aString
		in: aBehavior
		category: anotherString
		storingSource: true