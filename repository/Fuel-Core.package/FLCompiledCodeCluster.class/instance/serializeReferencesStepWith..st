serialize/materialize
serializeReferencesStepWith: anEncoder
	objects do: [ :compiledCode |
		self
			serializeLiteralsOf: compiledCode
			with: anEncoder ]