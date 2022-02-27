creating-traits-silently
silentlyNewTraitWithInstanceVariableNames: aString
	^ self
		silentlyNewTraitNamed: self defaultNewTraitName
		uses: Array new
		instanceVariableNames: aString