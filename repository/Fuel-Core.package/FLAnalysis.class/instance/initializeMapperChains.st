initialization
initializeMapperChains
	| standardMappers allMappers |
	standardMappers := self standardMappers.
	allMappers := self substitutionMappers asOrderedCollection
		addAll: standardMappers;
		reduceRight: [ :current :next | current next: next ];
		yourself.
	
	firstMapper := allMappers first.
	privateFirstMapper := standardMappers first