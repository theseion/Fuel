tests
assertSequencedSerializationEqualityOf: aCollectionToSerialize	
	| materializedCollection |
	self serializerConfig
		objectCollection: aCollectionToSerialize;
		serialize.
	
	materializedCollection := self materializerConfig materializeObjectCollection.
		
	self assertCollection: aCollectionToSerialize hasSameElements: materializedCollection