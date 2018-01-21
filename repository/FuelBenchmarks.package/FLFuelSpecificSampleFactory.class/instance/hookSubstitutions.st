samples
hookSubstitutions

	^ (1 to: self problemSize) 
		collect: [ :i | FLSubstitutedObject with: i ].
