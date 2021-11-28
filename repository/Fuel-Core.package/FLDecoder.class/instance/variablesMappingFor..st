accessing
variablesMappingFor: aClass
	| variables |
	variables := FLVariablesMapping
		materializing: aClass
		from: self.
	
	aClass withAllSuperclassesDo: [ :class |
		migrationsByTarget
			at: class
			ifPresent: [ :migrations |
				migrations do: [ :migration |
					migration applyTo: variables ] ] ].
		
	^ variables