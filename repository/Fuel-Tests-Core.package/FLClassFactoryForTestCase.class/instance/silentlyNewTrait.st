creating-traits-silently
silentlyNewTrait
	^ self
		silentlyNewTraitNamed: self defaultNewTraitName
		uses: Array new