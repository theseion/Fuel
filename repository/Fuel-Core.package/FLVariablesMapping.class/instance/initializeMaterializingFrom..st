serialize/materialize
initializeMaterializingFrom: aDecoder
	notIgnoredVariables := (1 to: aDecoder nextEncodedByte) collect: [ :index |
		aDecoder nextEncodedString ].

	mapping := notIgnoredVariables collect: [ :name |
		theClass
			instVarIndexFor: name
			ifAbsent: [ nil ] ].

	"Don't allocate unnecessary space for the dictionary if we don't need it."
	(mapping includes: nil) ifFalse: [ ^ self ].

	possibleTraitVariables := Dictionary new