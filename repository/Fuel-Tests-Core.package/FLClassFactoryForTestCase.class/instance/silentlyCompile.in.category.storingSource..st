compiling-silently
silentlyCompile: aString in: aBehavior category: anotherString storingSource: aBoolean
	^ self silentlyDo: [
		FLPlatform current 
			useAuthor: 'TestsAuthor'
			during: [
				aBehavior
					compile: aString
					classified: anotherString
					withStamp: nil 
					notifying: nil 
					logSource: aBoolean ] ]