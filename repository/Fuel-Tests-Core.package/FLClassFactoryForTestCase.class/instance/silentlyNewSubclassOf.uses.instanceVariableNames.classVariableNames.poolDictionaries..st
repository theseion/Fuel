creating-silently
silentlyNewSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames: classVarsString poolDictionaries: poolNamesString
	^ self silentlyDo: [
		self
			newSubclassOf: aClass
			uses: aTraitComposition
			instanceVariableNames: ivNamesString
			classVariableNames: classVarsString
			poolDictionaries: poolNamesString ]