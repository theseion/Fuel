tests
testPostMaterializationActionsMustBeClean
	self
		should: [ self serializerConfig addPostMaterializationAction: [ self ] ]
		raise: Error
		description: 'Post materializaton actions have to be clean closures. For more details see method BlocKClosure >> #isClean'