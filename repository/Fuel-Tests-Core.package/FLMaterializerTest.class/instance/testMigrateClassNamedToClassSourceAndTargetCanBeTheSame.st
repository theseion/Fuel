tests-configuring-migrations
testMigrateClassNamedToClassSourceAndTargetCanBeTheSame
	self
		shouldnt: [
			self materializer
				migrateClassNamed: #Object
				toClass: Object ]
		raise: FLConfigurationError