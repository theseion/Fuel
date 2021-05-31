accessing-defaults
defaultNewTraitName

	| postFix |
	postFix := (self createdTraits size + 1) printString.
	^ (#TraitForTestToBeDeleted, postFix) asSymbol