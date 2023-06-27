tests-configuring
testEnvironmentDefault
	self assert: FLSerializer new environment identicalTo: self class environment.
	self assert: FLMaterializer new environment identicalTo: self class environment