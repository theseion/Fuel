accessing
substitutionMappers
	^ self configuration substitutions collect: [ :assoc |
		FLPluggableSubstitutionMapper 
			when: assoc key
			substituteBy: assoc value ]