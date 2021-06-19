tests-configuring
testEnvironment
	| materializerEnvironment serializerEnvironment |
	serializerEnvironment := Dictionary new.
	materializerEnvironment := Dictionary new.
	serializer := FLSerializer new
		environment: serializerEnvironment;
		yourself.
	materializer := FLMaterializer new
		environment: materializerEnvironment;
		yourself.
	
	self assert: serializerEnvironment identicalTo: serializer environment.
	self assert: materializerEnvironment identicalTo: materializer environment.
	self deny: serializer environment identicalTo: materializer environment