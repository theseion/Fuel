tests-configuring-migrations
testMigrateClassNamedVariablesMustBeSymbolAndDictionary
	{
		Object new -> Dictionary new.
		Object -> Dictionary new.
		nil -> Dictionary new.
		true -> Dictionary new.
		Array new -> Dictionary new
	} do: [ :assoc |
		self
			should: [
				FLMaterializer new
					migrateClassNamed: assoc key
					variables: assoc value ]
			raise: FLConfigurationError ].
		
	{
		#Object -> Object.
		#Object -> Object new.
		#Object -> nil.
		#Object -> true.
		#Object -> Array new
	} do: [ :assoc |
		self
			should: [
				FLMaterializer new
					migrateClassNamed: assoc key
					variables: assoc value ]
			raise: FLConfigurationError ].
		
	{
		#Object -> Dictionary new.
		'Object' -> Dictionary new.
		#Object -> IdentityDictionary new.
		'Object' -> IdentityDictionary new
	} do: [ :assoc |
		self
			shouldnt: [
				FLMaterializer new
					migrateClassNamed: assoc key
					variables: assoc value ]
			raise: FLConfigurationError ]