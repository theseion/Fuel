tests-configuring-migrations
testMigrateClassNamedVariables
	| migration |
	self assert: self materializer migrations isEmpty.
	
	self materializer
		migrateClassNamed: #FLPair
		variables: Dictionary new.
	
	self assert: self materializer migrations size equals: 1.
	
	migration := self materializer migrations anyOne.
	self assert: migration sourceClassName identicalTo: #FLPair.
	self assert: migration targetClass identicalTo: FLPair