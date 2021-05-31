creating-silently
silentlyNewSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames: classVarsString
	^ self
		silentlyNewSubclassOf: aClass
		uses: aTraitComposition
		instanceVariableNames: ivNamesString
		classVariableNames: classVarsString
		poolDictionaries: ''