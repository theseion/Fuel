creating-traits-silently
silentlyNewTraitNamed: aTraitName uses: aTraitComposition
	^ self silentlyDo: [			
		self
			newTraitNamed: aTraitName
			uses: aTraitComposition ]