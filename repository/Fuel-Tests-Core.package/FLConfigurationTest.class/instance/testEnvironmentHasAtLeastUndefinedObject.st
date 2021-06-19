tests-configuring
testEnvironmentHasAtLeastUndefinedObject
	serializer := FLSerializer new
		environment: Dictionary new;
		yourself.
	materializer := FLMaterializer new
		environment: Dictionary new;
		yourself.
		
	self assert: (serializer environment includesKey: #UndefinedObject).
	self assert: (serializer environment at: #UndefinedObject) identicalTo: UndefinedObject.
	self assert: (materializer environment includesKey: #UndefinedObject).
	self assert: (materializer environment at: #UndefinedObject) identicalTo: UndefinedObject