creating-silently
silentlyNewSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames: classVarsString poolDictionaries: poolNamesString
	^ SystemAnnouncer uniqueInstance suspendAllWhile: [
		self
			newSubclassOf: aClass
			uses: aTraitComposition
			instanceVariableNames: ivNamesString
			classVariableNames: classVarsString
			poolDictionaries: poolNamesString ]