accessing
substitutionMappers
	^ self configuration whenBlocks collect: [ :assoc |
		FLPluggableSubstitutionMapper 
			when: assoc key
			substituteBy: assoc value ]