tests-configuring-migrations
testMigrateClassNamedToClass
	| migration |
	self assert: self materializer migrations isEmpty.
	
	self materializer
		migrateClassNamed: #FLPair
		toClass: Object.
	
	self assert: self materializer migrations size equals: 1.
	
	migration := self materializer migrations anyOne.
	self assert: migration sourceClassName identicalTo: #FLPair.
	self assert: migration targetClass identicalTo: Object