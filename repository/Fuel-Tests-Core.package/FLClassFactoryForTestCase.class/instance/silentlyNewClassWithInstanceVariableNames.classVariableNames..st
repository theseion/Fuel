creating-silently
silentlyNewClassWithInstanceVariableNames: aString classVariableNames: anotherString
	^ self
		silentlyNewSubclassOf: self defaultSuperclass
		instanceVariableNames: aString
		classVariableNames: anotherString