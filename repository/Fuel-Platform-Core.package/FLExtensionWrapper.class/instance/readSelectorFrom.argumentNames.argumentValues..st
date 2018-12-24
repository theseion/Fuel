initialize-release
readSelectorFrom: aPragma argumentNames: argumentNames argumentValues: argumentValues
	| index |
	index := argumentNames
		indexOf: 'selector:'
		ifAbsent: [ ^ aPragma method selector ].
	
	^ argumentValues at: index