creating-traits-silently
silentlyNewTraitNamed: aTraitName uses: aTraitComposition instanceVariableNames: aString
	^ self silentlyDo: [			
		self
			newTraitNamed: aTraitName
			uses: aTraitComposition
			instanceVariableNames: aString ]