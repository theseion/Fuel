running
tearDown
	filesMarkedForDeletion ifNotNil: [ :set | set do: [ :file |
		file exists ifTrue: [ file deleteAll ] ] ].

	super tearDown