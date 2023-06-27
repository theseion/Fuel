tests
assertMaterializedHasCorrectFormat: aClass
	| materializedClass |
	self serializer fullySerializeBehavior: aClass.
	
	materializedClass := self resultOfSerializeAndMaterialize: aClass.
	
	self deny: aClass identicalTo: materializedClass.
	self assert: aClass format equals: materializedClass format