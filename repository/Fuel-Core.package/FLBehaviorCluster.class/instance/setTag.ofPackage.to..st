serialize/materialize
setTag: packageTagName ofPackage: packageName to: aClass

	packageName = UndefinedPackage undefinedPackageName ifFalse: [
		aClass packageOrganizer
			packageNamed: packageName
			ifPresent: [ :package |
				^ aClass basicTag: (package ensureTag: packageTagName) ] ].

	aClass basicTag: aClass packageOrganizer undefinedPackage undefinedTag