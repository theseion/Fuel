tests-configuring-migrations
testMigrateClassNamedToClassMustBeSymbolAndClassOrSymbol
	{
		Object new -> Object.
		Object -> Object.
		nil -> Object.
		true -> Object.
		Array new -> Object
	} do: [ :assoc |
		self
			should: [
				FLMaterializer new
					migrateClassNamed: assoc key
					toClass: assoc value ]
			raise: FLConfigurationError ].
		
	{
		#Object -> Object new.
		#Object -> nil.
		#Object -> true.
		#Object -> Array new
	} do: [ :assoc |
		self
			should: [
				FLMaterializer new
					migrateClassNamed: assoc key
					toClass: assoc value ]
			raise: FLConfigurationError ].
		
	self
		should: [
			self materializer
				migrateClassNamed: #Object
				toClass: #Smalltalk ]
		raise: FLConfigurationError.
		
	{
		#Object -> Class.
		'Object' -> Class.
		#Object -> #Class.
		'Object' -> 'Class'
	} do: [ :assoc |
		self
			shouldnt: [
				FLMaterializer new
					migrateClassNamed: assoc key
					toClass: assoc value ]
			raise: FLConfigurationError ]