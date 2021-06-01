tests
testPreMaterializationActionsMustBeClean
	self
		should: [ self serializer addPreMaterializationAction: [ self ] ]
		raise: Error
		description: 'Pre materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean'