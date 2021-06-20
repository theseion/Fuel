tests-configuring-migrations
testMigrateClassNamedToClassVariables
	| migration |
	self assert: self materializer migrations isEmpty.
	
	self materializer
		migrateClassNamed: #FLPair
		toClass: Object
		variables: Dictionary new.
	
	self assert: self materializer migrations size equals: 1.
	
	migration := self materializer migrations anyOne.
	self assert: migration sourceClassName identicalTo: #FLPair.
	self assert: migration targetClass identicalTo: Object