accessing
lightGlobalMappers

	^ globalSymbols isEmpty
		ifTrue: [ #() ]
		ifFalse: [ Array with: (FLLightGlobalMapper for: self globalsFromSymbols) ]