serialize/materialize
materializeReferencesStepWith: aDecoder
	objects do: [ :compiledCode |
		self
			materializeLiteralsTo: compiledCode
			with: aDecoder ]