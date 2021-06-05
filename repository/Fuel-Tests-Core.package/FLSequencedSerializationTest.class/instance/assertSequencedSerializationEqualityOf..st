tests
assertSequencedSerializationEqualityOf: aCollectionToSerialize
			
	| fileName serializerConfig materializerConfig materializedCollection |
	fileName := 'sequencedSerializationTest.fuel'.
	FLSerializerConfiguration new
		fileName: fileName;
		objectCollection: aCollectionToSerialize;
		serialize.
	
	materializedCollection := FLMaterializerConfiguration new
		fileName: fileName;
		materializeObjectCollection.
		
	self assertCollection: aCollectionToSerialize equals: materializedCollection