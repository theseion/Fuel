tests
assertMaterializedHasCorrectFormat: aClass
	| materializedClass |	
	self serializer fullySerializeBehavior: aClass.
	materializedClass := self resultOfSerializeAndMaterialize: aClass.
	
	self deny: aClass == materializedClass.
	self assert: aClass typeOfClass = materializedClass typeOfClass.
	self assert: aClass format = materializedClass format.