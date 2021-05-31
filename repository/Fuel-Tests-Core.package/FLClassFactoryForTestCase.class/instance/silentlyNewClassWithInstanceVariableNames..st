creating-silently
silentlyNewClassWithInstanceVariableNames: aString
	^ self
		silentlyNewSubclassOf: self defaultSuperclass
		instanceVariableNames: aString