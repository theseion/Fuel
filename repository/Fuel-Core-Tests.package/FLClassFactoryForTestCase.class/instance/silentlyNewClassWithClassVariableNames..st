creating-silently
silentlyNewClassWithClassVariableNames: aString
	^ self
		silentlyNewSubclassOf: self defaultSuperclass
		instanceVariableNames: ''
		classVariableNames: aString