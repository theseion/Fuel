accessing-defaults
defaultNewClassName

	| postFix |
	postFix := self nextCount printString.
	^ (#ClassForTestToBeDeleted, postFix) asSymbol.