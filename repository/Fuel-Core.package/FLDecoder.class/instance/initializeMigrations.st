initialization
initializeMigrations
	migrationsBySource := IdentityDictionary new.
	migrationsByTarget := IdentityDictionary new.
	self configuration migrations do: [ :migration |
		migrationsBySource
			at: migration sourceClassName 
			put: migration.
		(migrationsByTarget
			at: migration targetClass
			ifAbsentPut: [ OrderedCollection new ])
				add: migration ]