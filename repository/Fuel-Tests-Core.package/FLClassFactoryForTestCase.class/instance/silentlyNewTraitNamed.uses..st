creating-traits-silently
silentlyNewTraitNamed: aTraitName uses: aTraitComposition
	^ SystemAnnouncer uniqueInstance suspendAllWhile: [			
		self
			newTraitNamed: aTraitName
			uses: aTraitComposition ]