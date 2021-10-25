creating-silently
silentlyNewSubclassOf: aClass uses: aTraitComposition
	^ self
		  silentlyNewSubclassOf: aClass
		  uses: aTraitComposition
		  instanceVariableNames: ''
		  classVariableNames: ''