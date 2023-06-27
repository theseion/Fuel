tests-configuring-migrations
testMigrateClassNamedToClassMustHaveUniqueSource
	self materializer
		migrateClassNamed: #Object
		toClass: Class.
		
	self
		should: [
			self materializer
				migrateClassNamed: #Object
				toClass: Behavior ]
		raise: FLConfigurationError