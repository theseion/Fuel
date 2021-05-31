creating-silently
silentlyNewSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames: classVarsString
	^ self
		silentlyNewSubclassOf: aClass
		uses: #()
		instanceVariableNames: ivNamesString
		classVariableNames: classVarsString